//#region Copyright (C) 2002 Francisco Monteiro
///*
//
//OGen
//Copyright (C) 2002 Francisco Monteiro
//
//Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
//
//The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
//
//THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
//
//*/
//#endregion
//using System;
//
//using Npgsql;
//
//using OGen.lib.collections;
//using OGen.lib.config;
//using OGen.lib.parser;
//using OGen.lib.presentationlayer.webforms;
//
//using OGen.lib.datalayer;
//using OGen.lib.datalayer.PostgreSQL;
//using OGen.lib.datalayer.SQLServer;
//
//using OGen.NTier.lib.metadata;
//using OGen.NTier.lib.datalayer;
//using OGen.NTier.lib.businesslayer;
//
//namespace OGen.NTier.lib.templates {
//	public class IMJustKeepingMyReferences {
//		public static void KeepThem() {
//			new OGen.lib.collections.SHashtable();
//			new OGen.lib.config.ConfigurationSettingsBinder();
//			OGen.lib.parser.ParserXSLT.Parse(
//				string.Empty, string.Empty, null, null
//			);
//			OGen.lib.presentationlayer.webforms.utils.ConcatenateURLParams(
//				null, false
//			);
//
//			object _whatever = null;
//			((OGen.lib.datalayer.cDBConnection)_whatever).Open();
//			((OGen.lib.datalayer.PostgreSQL.cDBConnection_PostgreSQL)_whatever).Open();
//			((OGen.lib.datalayer.SQLServer.cDBConnection_SQLServer)_whatever).Open();
//			((OGen.NTier.lib.metadata.cDBMetadata)_whatever).SaveState_toFile(string.Empty);
//			((OGen.NTier.lib.datalayer.DO__base)_whatever).DBConnection_createInstance(null, null, null);
//			((OGen.NTier.lib.businesslayer.BO__base)_whatever).ToString();
//
//			((Npgsql.NpgsqlConnection)_whatever).Open();
//		}
//	}
//}
