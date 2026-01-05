# SPDX-License-Identifier: BSD-3-Clause
# Copyright (c) Contributors to the OpenEXR Project.

openexr_define_library(Imath    
  PRIV_EXPORT IMATH_EXPORTS
  CURDIR ${CMAKE_CURRENT_SOURCE_DIR}
  SOURCES
    half.cpp
    ImathFun.cpp
    ImathMatrixAlgo.cpp
    ImathRandom.cpp
    toFloat.cpp
  HEADERS
  PRIVATE_DEPS
    ${OPENEXR_EXTRA_MATH_LIB}
  DEPENDENCIES
  )
