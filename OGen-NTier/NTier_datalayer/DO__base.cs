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
using System.Data;

using OGen.lib.datalayer;

namespace OGen.NTier.lib.datalayer {
	/// <summary>
	/// base implementation class for DataObject classes.
	/// </summary>
	public abstract class DO__base : IDisposable {
//		#region public DO__base(...);
		/// <param name="connection_in">DB Connection</param>
		public DO__base(
			cDBConnection connection_in
		) : this (
			connection_in, 
			string.Empty, 
			string.Empty, 
			false, // connection_insideInstance_in
			null
		) {}
		/// <param name="dbServerType_in">DB Server Type</param>
		/// <param name="connectionstring_in">Connection String</param>
		public DO__base(
			string dbServerType_in, 
			string connectionstring_in
		) : this (
			null, 
			dbServerType_in, 
			connectionstring_in, 
			true, // connection_insideInstance_in
			null
		) {}
		public DO__base(
			string dbServerType_in, 
			string connectionstring_in, 
			string logfile_in
		) : this (
			null, 
			dbServerType_in, 
			connectionstring_in, 
			true, // connection_insideInstance_in
			logfile_in
		) {}
		private DO__base(
			cDBConnection connection_in, 
			string dbServerType_in, 
			string connectionstring_in, 
			bool connection_insideInstance_in,
			string logfile_in
		) {
			connection_ = connection_in;
			connection_dbservertype_ = dbServerType_in;
			connection_connectionstring_ = connectionstring_in;
			connection_insideinstance_ = connection_insideInstance_in;

			if (logfile_in == null) {
				logenabled_ = false;
				logfile_ = null;
			} else {
				logenabled_ = true;
				logfile_ = logfile_in;
			}
		}
		///
		~DO__base() {
			cleanUp();
		}
		/// <summary>
		/// Disposes any instantiated Connection.
		/// </summary>
		public void Dispose() {
			System.GC.SuppressFinalize(this);
			cleanUp();
		}
		private void cleanUp() {
			if (connection_insideinstance_) {
				if (connection_ != null) {
					connection_.Dispose(); connection_ = null;
				}
			}
		}
//		#endregion

		//#region Properties...
//		#region public cDBConnection Connection { get; }
		private bool connection_insideinstance_;
		private string connection_dbservertype_;
		private string connection_connectionstring_;
		private cDBConnection connection_;
		private bool logenabled_;
		private string logfile_;
		/// <summary>
		/// DB Connection.
		/// </summary>
		public cDBConnection Connection {
			get {
				if (
					connection_insideinstance_
					&&
					(connection_ == null)
				) {
					// instantiating for the first time and
					// only because it became needed, otherwise
					// never instantiated...

					if (logenabled_) {
						connection_ =  DBConnection_createInstance(
							connection_dbservertype_,
							connection_connectionstring_,
							logfile_
						);
					} else {
						connection_ = DBConnection_createInstance(
							connection_dbservertype_,
							connection_connectionstring_, 
							null
						);
					}
				}
				return connection_;
			}
		}
//		#endregion
		//#endregion

		#region Methods...
		public abstract cDBConnection DBConnection_createInstance(
			string dbServerType_in, 
			string connectionstring_in, 
			string logfile_in
		);
		#endregion
	}
}
