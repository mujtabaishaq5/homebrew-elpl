#include <jni.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#ifdef __APPLE__
#include <mach-o/dyld.h>
#elif defined(_WIN32)
#include <windows.h>
#elif defined(__linux__)
#include <unistd.h>
#endif

void get_jar_path(char *dest, size_t size) {
    char exe_path[1024];
    memset(exe_path, 0, sizeof(exe_path));

#ifdef __APPLE__
    uint32_t bufsize = sizeof(exe_path);
    if (_NSGetExecutablePath(exe_path, &bufsize) != 0) {
        strncpy(exe_path, "/usr/local/bin/elpl", sizeof(exe_path));
    }
#elif defined(_WIN32)
    GetModuleFileNameA(NULL, exe_path, sizeof(exe_path));
#elif defined(__linux__)
    ssize_t len = readlink("/proc/self/exe", exe_path, sizeof(exe_path) - 1);
    if (len != -1) exe_path[len] = '\0';
#endif

    char *last_slash = strrchr(exe_path, '/');
#ifdef _WIN32
    char *last_backslash = strrchr(exe_path, '\\');
    if (last_backslash && (!last_slash || last_backslash > last_slash)) {
        last_slash = last_backslash;
    }
#endif

    if (last_slash) {
        *last_slash = '\0'; 
        // Dynamically resolves to sibling directory: bin/../lib/elplc/elplc.jar
        snprintf(dest, size, "-Djava.class.path=%s/../lib/elplc/elplc.jar", exe_path);
    } else {
        snprintf(dest, size, "-Djava.class.path=/usr/local/lib/elplc/elplc.jar");
    }
}

int main(int argc, char **argv) {
    JavaVM *jvm;
    JNIEnv *env;
    JavaVMInitArgs vm_args;
    JavaVMOption options[1];

    char classpath[2048];
    get_jar_path(classpath, sizeof(classpath));
    options[0].optionString = classpath;

    vm_args.version = JNI_VERSION_1_8;
    vm_args.nOptions = 1;
    vm_args.options = options;
    vm_args.ignoreUnrecognized = JNI_TRUE;

    if (JNI_CreateJavaVM(&jvm, (void**)&env, &vm_args) < 0) {
        fprintf(stderr, "Error: Failed to launch HotSpot JVM runtime. Ensure Java 17+ is installed and JAVA_HOME is set.\n");
        return 1;
    }

    jclass cls = (*env)->FindClass(env, "syed/Main");
    if (cls == NULL) {
        fprintf(stderr, "Error: Could not find syed.Main in elplc.jar\n");
        (*jvm)->DestroyJavaVM(jvm);
        return 1;
    }

    jmethodID mid = (*env)->GetStaticMethodID(env, cls, "main", "([Ljava/lang/String;)V");
    if (mid == NULL) {
        fprintf(stderr, "Error: Could not find main(String[]) method\n");
        (*jvm)->DestroyJavaVM(jvm);
        return 1;
    }

    jobjectArray jargs = (*env)->NewObjectArray(env, argc - 1, (*env)->FindClass(env, "java/lang/String"), NULL);
    for (int i = 1; i < argc; i++) {
        (*env)->SetObjectArrayElement(env, jargs, i - 1, (*env)->NewStringUTF(env, argv[i]));
    }

    (*env)->CallStaticVoidMethod(env, cls, mid, jargs);
    (*jvm)->DestroyJavaVM(jvm);
    return 0;
}