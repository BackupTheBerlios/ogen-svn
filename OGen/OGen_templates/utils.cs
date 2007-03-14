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

namespace OGen.lib.templates {
	public class utils { private utils() {}

		public class OutputMode { private OutputMode() {}
			public static cOutput.eMode Parse_NEW(string outputMode_in) {
				for (int i = 0;; i++) {
					if (((cOutput.eMode)i).ToString() == outputMode_in) {
						return (cOutput.eMode)i;
					} else if (
						(((cOutput.eMode)i) == cOutput.eMode.invalid)
						||
						(((cOutput.eMode)i).ToString() == string.Empty)
					) {
						return cOutput.eMode.invalid;
					}
				}
			}
		}

		public class OutputType { private OutputType() {}
			//public class convert { private convert() {}
			//}

//			#region public static cTemplate.eOutputType Parse(string outputType_in);
//			public static cTemplate.eOutputType Parse(string outputType_in) {
//				for (int i = 0;; i++) {
//					if (((cTemplate.eOutputType)i).ToString() == outputType_in) {
//						return (cTemplate.eOutputType)i;
//					} else if (((cTemplate.eOutputType)i).ToString() == string.Empty) {
//						return cTemplate.eOutputType.File;
//					}
//				}
//			}
			public static cOutput.eType Parse_NEW(string outputType_in) {
				for (int i = 0;; i++) {
					if (((cOutput.eType)i).ToString() == outputType_in) {
						return (cOutput.eType)i;
					} else if (
						(((cOutput.eType)i) == cOutput.eType.invalid)
						||
						(((cOutput.eType)i).ToString() == string.Empty)
					) {
						return cOutput.eType.invalid;
					}
				}
			}
//			#endregion
		}

		public class TemplateType { private TemplateType() {}
			//public class convert { private convert() {}
			//}

			#region public static cTemplate.eParserType Parse(string templateType_in);
			public static cTemplate.eParserType Parse(string templateType_in) {
				for (int i = 0;; i++) {
					if (((cTemplate.eParserType)i).ToString() == templateType_in) {
						return (cTemplate.eParserType)i;
					} else if (
						((cTemplate.eParserType)i == cTemplate.eParserType.invalid)
						||
						(((cTemplate.eParserType)i).ToString() == string.Empty)
					) {
						return cTemplate.eParserType.invalid;
					}
				}
			}
			#endregion
		}
	}
}