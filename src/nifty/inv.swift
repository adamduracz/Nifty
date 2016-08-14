/*******************************************************************************
 *  inv.swift
 *
 *  This file provides functionality for inverting a matrix.
 *
 *  Author: Philip Erickson
 *  Creation Date: 1 May 2016
 *  Contributors: 
 *
 *  Licensed under the Apache License, Version 2.0 (the "License");
 *  you may not use this file except in compliance with the License.
 *  You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 *  Unless required by applicable law or agreed to in writing, software
 *  distributed under the License is distributed on an "AS IS" BASIS,
 *  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *  See the License for the specific language governing permissions and
 *  limitations under the License.
 *
 *  Copyright 2016 Philip Erickson
 ******************************************************************************/

// TODO: complete doc

/// Compute the inverse of a given matrix.
///
/// - Parameters:
///     - A: square matrix to invert
/// - Returns: inverse of A matrix
public func inv(_ A: Matrix) -> Matrix
{
	precondition(A.size[0] == A.size[1], "Matrix must be square")

	let n = Int32(A.size[0])
	let m = n
	var a = A.data
	let lda = n
	var ipiv = Array<Int32>(repeating: 0, count: Int(n))		

	// compute LU factorization
	var info = LAPACKE_dgetrf(LAPACK_ROW_MAJOR, m, n, &a, lda, &ipiv)
	precondition(info >= 0, "Illegal value in LAPACK argument \(-1*info)")

	// use LU factorization to compute inverse
	info = LAPACKE_dgetri(LAPACK_ROW_MAJOR, n, &a, lda, &ipiv)
	precondition(info >= 0, "Illegal value in LAPACK argument \(-1*info)")
	precondition(info == 0, "Cannot invert singular matrix")
	
	return Matrix(size: Int(n), Int(n), data: a)
}