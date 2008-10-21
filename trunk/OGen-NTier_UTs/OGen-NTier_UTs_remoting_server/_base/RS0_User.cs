﻿#region Copyright (C) 2002 Francisco Monteiro
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

namespace OGen.NTier.UTs.lib.distributedlayer.remoting.server {
	public abstract class RS0_User : MarshalByRefObject {
		#region private Properties...
		#endregion
		#region public Properties...
		#endregion

		#region private Methods...
		#endregion
		#region public Methods...
		#region public long insObject(...);
		public long insObject(
			OGen.NTier.UTs.lib.datalayer.proxy.SO_User user_in,
			bool selectIdentity_in,
			string login_in, 
			out bool constraintExist_out
		) {
			BDO_User _businessobject = new BDO_User(
			);
			return _businessobject.insObject(
				user_in,
				selectIdentity_in,
				login_in, 
				out constraintExist_out
			);
		}
		#endregion
		#region public OGen.NTier.UTs.lib.datalayer.proxy.SO_User getObject(...);
		public OGen.NTier.UTs.lib.datalayer.proxy.SO_User getObject(
			long idUser_in,
			string login_in, 
			out bool exists_out
		) {
			BDO_User _businessobject = new BDO_User(
			);
			return _businessobject.getObject(
				idUser_in, 
				login_in, 
				out exists_out
			);
		}
		#endregion
		#region public OGen.NTier.UTs.lib.datalayer.proxy.SC_User Record_Open_byGroup(...);
		public OGen.NTier.UTs.lib.datalayer.proxy.SC_User Record_Open_byGroup(
			long IDGroup_search_in,
			int page_in,
			int page_numRecords_in,
			string login_in
		) {
			BDO_User _businessobject = new BDO_User(
			);
			return _businessobject.Record_Open_byGroup(
				IDGroup_search_in,
				page_in,
				page_numRecords_in,
				login_in
			);
		}
		#endregion
		#endregion
	}
}