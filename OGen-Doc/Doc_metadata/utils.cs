using System;
using System.Text.RegularExpressions;

namespace OGen.Doc.lib.metadata {
	public class utils { private utils() {}

		private static Regex fields_reg = new Regex(
			"^(?<before>.*)\\${(?<command>.*)::(?<params>.*)}(?<after>.*)",
			RegexOptions.Compiled |
			RegexOptions.IgnoreCase
		);

		public static string translate(
			string text_in, 
			DocMetadata root_in
		) {
			string translate_out = text_in;
			string _translation;
			Match _matchingfields;

			while ((
				_matchingfields = fields_reg.Match(translate_out)
			).Success) {
				switch (_matchingfields.Groups["command"].Value.ToLower()) {
					case "config": {
						_translation 
							= root_in.Configs[
								_matchingfields.Groups["params"].Value
							].Value;
						
						break;
					}
					case "code": {
						_translation 
							= "<div class='code'><pre>"
							+ root_in.CodeSamples[
								_matchingfields.Groups["params"].Value
							].Code
							+ "</pre></div>";
						
						break;
					}
					case "link-external": {
						Link _link = root_in.Links[
							_matchingfields.Groups["params"].Value
						];
						_translation = string.Format(
							"<a href='{0}'>{1}</a>", 
							_link.URL, 
							_link.Name
						);
						
						break;
					}
					default: {
						throw new Exception(string.Format(
							"unknown command: {0}", 
							_matchingfields.Groups["command"].Value
						));
					}
				}
				translate_out 
					= _matchingfields.Groups["before"].Value 
					+ _translation 
					+ _matchingfields.Groups["after"].Value
				;
			}

			return translate_out;


//			string translate_out = text_in;
//			int b, bb, be, e, eb, ee, m;
//
//			e = -1;
//			while ((b = translate_out.IndexOf("${", e + 1)) >= 0) {
//				be = b + 2;
//				bb = b - 1;
//
//				e = translate_out.IndexOf("}", be);
//				eb = e - 1;
//
//				m = translate_out.IndexOf(
//					"::", 
//					be, 
//					eb - be + 1
//				);
//
//				translate_out 
//					= (b != 0) ? translate_out.Substring(0, b - 1) : ""
//					+ "&lt;" + m + "&gt;"
//					+ translate_out.Substring(e + 1);
//			}
//
//			return translate_out;
		}
	}
}