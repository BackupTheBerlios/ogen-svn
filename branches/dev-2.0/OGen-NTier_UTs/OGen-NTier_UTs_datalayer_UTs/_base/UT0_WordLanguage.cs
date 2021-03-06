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
using System.Data;
using NUnit.Framework;

using OGen.NTier.UTs.lib.datalayer;

namespace OGen.NTier.UTs.lib.datalayer.UTs {
	public class UT0_WordLanguage { public UT0_WordLanguage() {}

		#region protected Properties...
		#endregion

		[Test]
		public void UT_SetGetDelSequence() {
			DO_WordLanguage _wordlanguage;
			try {
				_wordlanguage = new DO_WordLanguage();
			} catch (Exception e) {
				Assert.IsTrue(false, "some error trying to instantiate DO_WordLanguage\n---\n{0}\n---", e.Message);
				return; // no need...
			}
			_wordlanguage.Connection.Open();
			_wordlanguage.Connection.Transaction.Begin();



			_wordlanguage.Fields.IDWord = 123L;
			_wordlanguage.Fields.IDLanguage = 123L;
			_wordlanguage.Fields.Translation = "123";
			// setObject(); // ToDos: here!



			_wordlanguage.Connection.Transaction.Rollback();
			_wordlanguage.Connection.Transaction.Terminate();
			_wordlanguage.Connection.Close();
			_wordlanguage.Dispose(); _wordlanguage = null;
		}
	}
}