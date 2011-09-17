#region Copyright (C) 2002 Francisco Monteiro
/*

OGen
Copyright (c) 2002 Francisco Monteiro

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/
#endregion
using System;

using OGen.lib.datalayer;
#if PostgreSQL
using OGen.lib.datalayer.PostgreSQL;
#endif

using OGen.NTier.lib.datalayer;

namespace OGen.NTier.Kick.lib.datalayer {
	/// <summary>
	/// utils DataObject which works as a repository of useful Properties and Methods for DataObjects at OGen.NTier.Kick.lib.datalayer namespace.
	/// </summary>
	public sealed 
#if USE_PARTIAL_CLASSES && !NET_1_1
		partial 
#endif
		class DO__utils 
#if !USE_PARTIAL_CLASSES || NET_1_1
		: DO0__utils
#endif
	{

		// add your code here!

	}
}