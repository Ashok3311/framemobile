// Top-level build file where you can add configuration options common to all sub-projects/modules.

plugins {
    id("com.android.application") version "8.7.0" apply false
    kotlin("android") version "1.8.22" apply false // Keep Kotlin version stable
}

buildscript {
    repositories {
        google()
        mavenCentral()
    }
    dependencies {
        classpath("com.android.tools.build:gradle:8.7.0") // Ensure Gradle version matches
        classpath("org.jetbrains.kotlin:kotlin-gradle-plugin:1.8.22") // Use correct Kotlin version
    }
}

allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

// ✅ Fix build directory structure
val newBuildDir = rootProject.layout.buildDirectory.dir("../../build").get()
rootProject.layout.buildDirectory.set(newBuildDir)

subprojects {
    val newSubprojectBuildDir = newBuildDir.dir(project.name)
    project.layout.buildDirectory.set(newSubprojectBuildDir)
}

subprojects {
    project.evaluationDependsOn(":app")
}

tasks.register("clean", Delete::class) {
    delete(rootProject.buildDir)
}
