#!/bin/bash

# =======================================================
# Bigasus (Pegasus Frontend) Installer for Termux
# الهدف: تثبيت واجهة Pegasus Frontend لإدارة الألعاب والمحاكيات
# =======================================================

echo "Starting Pegasus Termux Setup..."

# التأكد من وجود termux-api لإذن التخزين
if ! command -v termux-setup-storage &> /dev/null
then
    echo "⚠️ termux-api is required. Installing now..."
    pkg install termux-api -y
fi

# 1. طلب إذن الوصول إلى التخزين (ضروري لقراءة ملفات الألعاب)
echo "1/3: Requesting storage permission. Please follow the prompt on your screen."
termux-setup-storage

# 2. تحديد مجلد العمل وتحميل ملفات الميتا داتا
INSTALL_DIR="$HOME/pegasus-frontend-setup"
METADATA_REPO="https://github.com/dragoonDorise/pegasus-android-metadata.git"
PEGASUS_APK_URL="https://github.com/mmatyas/pegasus-frontend/releases/latest/download/pegasus-fe_latest_android.apk"
APK_FILE="pegasus-fe.apk"

# حذف المجلد القديم إذا كان موجوداً وإعادة الإنشاء
rm -rf "$INSTALL_DIR"
mkdir -p "$INSTALL_DIR"
cd "$INSTALL_DIR"

echo "2/3: Cloning Pegasus metadata files..."
git clone "$METADATA_REPO"

# 3. تحميل تطبيق Pegasus Frontend APK (أحدث إصدار)
echo "3/3: Downloading the latest Pegasus Frontend APK..."
wget -q --show-progress "$PEGASUS_APK_URL" -O "$APK_FILE"

# 4. رسالة الإتمام والتعليمات
echo -e "\n======================================================="
echo "✅ SUCCESS: Pegasus Frontend files downloaded successfully!"
echo "======================================================="
echo "الخطوة التالية هي تثبيت التطبيق يدوياً."
echo "لتثبيت تطبيق Pegasus Frontend، قم بتشغيل الأمر التالي في Termux:"
echo -e "\n\txdg-open $INSTALL_DIR/$APK_FILE\n"
echo "بعد التثبيت، قم بفتح تطبيق 'Pegasus Frontend' من قائمة تطبيقات هاتفك وإعداده."
