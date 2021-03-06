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
using System.IO;
using System.Collections;
using System.Runtime.Remoting.Channels;
using System.Runtime.Remoting.Messaging;

namespace OGen.NTier.lib.distributedlayer.remoting.client {
	public class EncryptionClientSinkProvider :
		IClientChannelSinkProvider
	{
		#region public RS_EncryptionClientSinkProvider(...);
		public EncryptionClientSinkProvider(
			IDictionary properties_in,
			ICollection providerData_in
		) {
			keyspath_ = (string)properties_in["keysPath"];
			clientid_ = (string)properties_in["clientID"];
		} 
		#endregion

		#region public IClientChannelSinkProvider Next { get; set; }
		private IClientChannelSinkProvider next_;

		public IClientChannelSinkProvider Next {
			get { return next_; }
			set { next_ = value; }
		} 
		#endregion
		private string keyspath_;
		private string clientid_;

		#region public IClientChannelSink CreateSink(...);
		public IClientChannelSink CreateSink(
			IChannelSender channel_in,
			string url_in,
			object remoteChannelData_in
		) {
			IClientChannelSink _next = next_.CreateSink(
				channel_in,
				url_in,
				remoteChannelData_in
			);

			return new EncryptionClientSink(
				_next, 
				keyspath_, 
				clientid_
			);
		} 
		#endregion
	}
}