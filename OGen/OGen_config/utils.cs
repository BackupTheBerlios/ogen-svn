#region Copyright (C) 2002 Francisco Monteiro
/*

OGen
Copyright (C) 2002 Francisco Monteiro

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/
#endregion
using System;

namespace OGen.lib.config {
	/// <summary>
	/// Provides a number of classes with static auxiliar methods for the OGen.lib.config namespace.
	/// </summary>
	public class utils { private utils() {}
		static utils() {
			applicationname_ = null;
		}

		#region public static string ApplicationName();
		private static string applicationname_;

		/// <summary>
		/// Gets the current running Application Name.
		/// </summary>
		public static string ApplicationName {
			get {
				if (applicationname_ == null) {
					string _applicationname_aux = Environment.CommandLine.Trim();

					int _end;
					if (_applicationname_aux.IndexOf("\"", 0) == 0) {
						_end = _applicationname_aux.IndexOf("\"", 1);
						_applicationname_aux = _applicationname_aux.Substring(1, _end - 1);
					} else {
						_end = _applicationname_aux.IndexOf(" ");
						if (_end > 0) {
							_applicationname_aux = _applicationname_aux.Substring(0, _end);
						}
					}

					applicationname_ = _applicationname_aux;
				}

				return applicationname_;
			}
		}
		#endregion
	}
}
