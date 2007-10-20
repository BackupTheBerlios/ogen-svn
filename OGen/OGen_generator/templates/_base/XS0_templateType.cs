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
using System.Xml.Serialization;
using System.Collections;

using OGen.lib.collections;

namespace OGen.lib.templates {
	public class XS0_templateType
#if !NET_1_1
		: OGenCollectionInterface<string>
#endif
	{
		public XS0_templateType (
		) {
			argumentscollection_ = new 
#if !NET_1_1
				OGenSimpleCollection<XS_argumentsType>()
#else
				XS_argumentsTypeCollection()
#endif
			;
			conditionscollection_ = new 
#if !NET_1_1
				OGenSimpleCollection<XS_conditionsType>()
#else
				XS_conditionsTypeCollection()
#endif
			;
			dependenciescollection_ = new 
#if !NET_1_1
				OGenSimpleCollection<XS_dependenciesType>()
#else
				XS_dependenciesTypeCollection()
#endif
			;
		}
		public XS0_templateType (
			string name_in
		) : this (
		) {
			name_ = name_in;
		}

#if !NET_1_1
		#region public string CollectionName { get; }
		[XmlIgnore()]
		public string CollectionName {
			get {
				return Name;
			}
		}
		#endregion
#endif
		#region public string Name { get; set; }
		private string name_;

		[XmlAttribute("name")]
		public string Name {
			get {
				return name_;
			}
			set {
				name_ = value;
			}
		}
		#endregion
		#region public XS_ParserEnumeration ParserType { get; set; }
		private XS_ParserEnumeration parsertype_;

		[XmlAttribute("parserType")]
		public XS_ParserEnumeration ParserType {
			get {
				return parsertype_;
			}
			set {
				parsertype_ = value;
			}
		}
		#endregion
		#region public string IterationType { get; set; }
		private string iterationtype_;

		[XmlAttribute("iterationType")]
		public string IterationType {
			get {
				return iterationtype_;
			}
			set {
				iterationtype_ = value;
			}
		}
		#endregion
		#region public ... ArgumentsCollection { get; }
		private 
#if !NET_1_1
			OGenSimpleCollection<XS_argumentsType>
#else
			XS_argumentsTypeCollection
#endif
			argumentscollection_;

		[XmlElement("arguments")]
		public XS_argumentsType[] arguments__xml {
			get { return argumentscollection_.cols__; }
			set { argumentscollection_.cols__ = value; }
		}

		[XmlIgnore()]
		public
#if !NET_1_1
			OGenSimpleCollection<XS_argumentsType>
#else
			XS_argumentsTypeCollection
#endif
		ArgumentsCollection
		{
			get { return argumentscollection_; }
		}
		#endregion
		#region public ... ConditionsCollection { get; }
		private 
#if !NET_1_1
			OGenSimpleCollection<XS_conditionsType>
#else
			XS_conditionsTypeCollection
#endif
			conditionscollection_;

		[XmlElement("conditions")]
		public XS_conditionsType[] conditions__xml {
			get { return conditionscollection_.cols__; }
			set { conditionscollection_.cols__ = value; }
		}

		[XmlIgnore()]
		public
#if !NET_1_1
			OGenSimpleCollection<XS_conditionsType>
#else
			XS_conditionsTypeCollection
#endif
		ConditionsCollection
		{
			get { return conditionscollection_; }
		}
		#endregion
		#region public ... DependenciesCollection { get; }
		private 
#if !NET_1_1
			OGenSimpleCollection<XS_dependenciesType>
#else
			XS_dependenciesTypeCollection
#endif
			dependenciescollection_;

		[XmlElement("dependencies")]
		public XS_dependenciesType[] dependencies__xml {
			get { return dependenciescollection_.cols__; }
			set { dependenciescollection_.cols__ = value; }
		}

		[XmlIgnore()]
		public
#if !NET_1_1
			OGenSimpleCollection<XS_dependenciesType>
#else
			XS_dependenciesTypeCollection
#endif
		DependenciesCollection
		{
			get { return dependenciescollection_; }
		}
		#endregion
	}
}