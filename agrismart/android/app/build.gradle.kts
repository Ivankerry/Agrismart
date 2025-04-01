plugins {
    id("com.android.application")
    id("kotlin-android")
    id("dev.flutter.flutter-gradle-plugin") // Flutter Gradle Plugin
    id("com.google.gms.google-services") // Firebase Plugin
}

android {
    namespace = "com.example.agrismart"
    compileSdk = 34
    ndkVersion = "27.0.12077973"

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    defaultConfig {
        applicationId = "com.example.agrismart"
        minSdk = 23
        targetSdk = 33
        versionCode = 1
        versionName = "1.0"
    }

    buildTypes {
        release {
            signingConfig = signingConfigs.getByName("debug")
        }
    }

    sourceSets["main"].manifest.srcFile("app/src/main/AndroidManifest.xml")
}

flutter {
    source = "../.."
}

repositories {
    google()
    mavenCentral()
}

dependencies {
    implementation("com.google.firebase:firebase-auth-ktx:22.1.1")
    implementation("com.google.firebase:firebase-core:21.2.0")
}

// Apply the Google Services plugin
apply(plugin = "com.google.gms.google-services")
