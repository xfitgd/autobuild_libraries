#!/bin/bash
set -e

# freetype 빌드 스크립트
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
FREETYPE_DIR="${SCRIPT_DIR}/libs/freetype"
BUILD_DIR="${SCRIPT_DIR}/build/freetype"
INSTALL_DIR="${SCRIPT_DIR}/install/freetype"

# freetype 디렉토리 확인
if [ ! -d "${FREETYPE_DIR}" ]; then
    echo "Error: freetype submodule이 없습니다. 'git submodule update --init --recursive'를 실행하세요."
    exit 1
fi

# 빌드 디렉토리 생성
mkdir -p "${BUILD_DIR}"
mkdir -p "${INSTALL_DIR}"

cd "${BUILD_DIR}"

# CMake 설정
cmake "${FREETYPE_DIR}" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="${INSTALL_DIR}" \
    -DBUILD_SHARED_LIBS=ON \
    -DFT_DISABLE_ZLIB=OFF \
    -DFT_DISABLE_BZIP2=OFF \
    -DFT_DISABLE_PNG=OFF \
    -DFT_DISABLE_HARFBUZZ=OFF

# 빌드
cmake --build . --config Release -j$(nproc)

# 설치
cmake --install .

echo "freetype 빌드 완료: ${INSTALL_DIR}"

