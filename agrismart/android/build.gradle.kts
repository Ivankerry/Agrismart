buildscript {
    repositories {
        google()
        mavenCentral()
    }
    dependencies {
        classpath("com.android.tools.build:gradle:8.1.1")
        classpath("com.google.gms:google-services:4.3.15") // Add this line
    }
}

plugins {
    id("com.android.application")
    id("kotlin-android")
    id("com.google.gms.google-services") // Add this line
}

android {
    namespace = "com.example.agrismart"
    compileSdk = 34

    defaultConfig {
        applicationId = "com.example.agrismart"
        minSdk = 23
        targetSdk = 33
        versionCode = 1
        versionName = "1.0"
    }

    buildTypes {
        release {
            isMinifyEnabled = false
            proguardFiles(getDefaultProguardFile("proguard-android-optimize.txt"), "proguard-rules.pro")
        }
    }

    sourceSets {
        getByName("main") {
            manifest.srcFile("app/src/main/AndroidManifest.xml") // Adjusted to match your file path
        }
    }
}

dependencies {
    implementation("androidx.core:core-ktx:1.10.1") // Latest AndroidX Core library

    implementation("com.google.gms:google-services:4.3.15")
}
