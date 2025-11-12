#!/bin/bash

# =======================================================
# Bigasus (Pegasus Frontend) Installer for Termux
# الهدف: تثبيت واجهة Pegasus Frontend لإدارة الألعاب والمحاكيات
# =======================================================

# 1. تثبيت وتحديث الأدوات الأساسية
echo "Starting installation..."
echo "1/5: Updating Termux and installing dependencies (wget, git, termux-api)..."
pkg update -y
pkg install wget git termux-api -y

# 2. طلب إذن الوصول إلى التخزين
# هذا ضروري ليتمكن Pegasus من قراءة ملفات الألعاب من ذاكرة هاتفك.
echo "2/5: Requesting storage permission. Please follow the prompt."
termux-setup-storage

# 3. تحديد مجلد العمل وتحميل ملفات الميتا داتا
INSTALL_DIR="$HOME/pegasus-frontend-setup"
METADATA_REPO="https://github.com/dragoonDorise/pegasus-android-metadata.git"
PEGASUS_APK_URL="https://github.com/mmatyas/pegasus-frontend/releases/latest/download/pegasus-fe_latest_android.apk"
APK_FILE="pegasus-fe.apk"

mkdir -p "$INSTALL_DIR"
cd "$INSTALL_DIR"

echo "3/5: Cloning Pegasus metadata files..."
git clone "$METADATA_REPO"

# 4. تحميل تطبيق Pegasus Frontend APK (أحدث إصدار)
echo "4/5: Downloading the latest Pegasus Frontend APK..."
wget -q --show-progress "$PEGASUS_APK_URL" -O "$APK_FILE"

# 5. إنهاء التثبيت وتقديم التعليمات
echo "5/5: Installation files are ready."
echo -e "\n======================================================="
echo "✅ SUCCESS: Installation files downloaded successfully!"
echo "======================================================="
echo "الخطوة التالية هي تثبيت التطبيق يدوياً."
echo "لتثبيت تطبيق Pegasus Frontend، قم بتشغيل الأمر التالي في Termux:"
echo -e "\n\txdg-open $INSTALL_DIR/$APK_FILE\n"
echo "بعد التثبيت، قم بفتح تطبيق 'Pegasus Frontend' من قائمة تطبيقات هاتفك."
echo -e "يمكنك إيجاد ملفات الإعدادات في: $INSTALL_DIR/pegasus-android-metadata"

# ملاحظة: إذا كنت تقصد أداة الاختراق (Pegasus-Neo)، يمكنك استبدال
# METADATA_REPO و PEGASUS_APK_URL برابط مستودع Pegasus-Neo.
