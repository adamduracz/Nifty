/***************************************************************************************************
 *  log10.swift
 *
 *  This file provides base 10 logarithm functionality.
 *
 *  Author: Philip Erickson
 *  Creation Date: 1 May 2016
 *
 *  Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except
 *  in compliance with the License. You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 *  Unless required by applicable law or agreed to in writing, software distributed under the 
 *  License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either 
 *  express or implied. See the License for the specific language governing permissions and 
 *  limitations under the License.
 *
 *  Copyright 2016 Philip Erickson
 **************************************************************************************************/

#if os(Linux)

import Glibc

/// Convenience wrapper to make glibc implementation available through Nifty.
///
/// Return the base-10 logarithm of x, where log10(x) = log(x)/log(10).
public let log10: (Double) -> Double = Glibc.log10

#else

import Darwin

/// Convenience wrapper to make glibc implementation available through Nifty.
///
/// Return the base-10 logarithm of x, where log10(x) = log(x)/log(10).
public let log10: (Double) -> Double = Darwin.log10

#endif
