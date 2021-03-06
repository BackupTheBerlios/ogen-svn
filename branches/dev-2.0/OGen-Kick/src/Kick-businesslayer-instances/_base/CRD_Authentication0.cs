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
using System.Collections.Generic;
using System.Text;

#if BUSINESSOBJECT
using OGen.NTier.Kick.lib.businesslayer;
#endif
using OGen.NTier.Kick.lib.businesslayer.shared;
#if REMOTINGCLIENT
using OGen.NTier.Kick.lib.distributedlayer.remoting.client;
#endif
#if WEBSERVICESCLIENT
using OGen.NTier.Kick.lib.distributedlayer.webservices.client;
#endif

namespace OGen.NTier.Kick.lib.businesslayer.shared.instances {
	public class CRD_Authentication {
		private CRD_Authentication() { }

		static CRD_Authentication() {
#if BUSINESSOBJECT && REMOTINGCLIENT && WEBSERVICESCLIENT
			BusinessObject = new BO_CRD_Authentication();
			RemotingClient = new RC_CRD_Authentication();
			WebserviceClient = new WC_CRD_Authentication();
#else
#if BUSINESSOBJECT
			InstanceClient = new BO_CRD_Authentication();
#endif
#if REMOTINGCLIENT
			InstanceClient = new RC_CRD_Authentication();
#endif
#if WEBSERVICESCLIENT
			InstanceClient = new WC_CRD_Authentication();
#endif
#endif
		}

#if BUSINESSOBJECT && REMOTINGCLIENT && WEBSERVICESCLIENT
		public static IBO_CRD_Authentication BusinessObject;
		public static IBO_CRD_Authentication RemotingClient;
		public static IBO_CRD_Authentication WebserviceClient;
#else
		public static IBO_CRD_Authentication InstanceClient;
#endif

		public static void ReConfig() {
#if BUSINESSOBJECT && REMOTINGCLIENT && WEBSERVICESCLIENT
			RC_CRD_Authentication.ReConfig();
			((WC_CRD_Authentication)WebserviceClient).ReConfig();
#else
#if REMOTINGCLIENT
			RC_CRD_Authentication.ReConfig();
#endif
#if WEBSERVICESCLIENT
			((WC_CRD_Authentication)InstanceClient).ReConfig();
#endif
#endif
		}
	}
}