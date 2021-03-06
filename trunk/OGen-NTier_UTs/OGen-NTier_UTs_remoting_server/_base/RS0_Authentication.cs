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

using OGen.NTier.UTs.lib.businesslayer;

namespace OGen.NTier.UTs.distributedlayer.remoting.server {
	/// <summary>
	/// Authentication remoting server.
	/// </summary>
	public abstract class RS0_Authentication : MarshalByRefObject {
		#region public string Login(...);
		public string Login(
			string login_in, 
			string password_in
		) {
			BO_Authentication _businessobject = new BO_Authentication(
			);
			return _businessobject.Login(
				login_in, 
				password_in
			);
		}
		#endregion
		#region public void Logout(...);
		public void Logout(
		) {
			BO_Authentication _businessobject = new BO_Authentication(
			);
			_businessobject.Logout(
			);
		}
		#endregion
	}
}