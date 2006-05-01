#region Copyright (C) 2002 Francisco Monteiro
/*

OGen
Copyright (C) 2002 Francisco Monteiro

This file is part of OGen.

OGen is free software; you can redistribute it and/or modify 
it under the terms of the GNU General Public License as published by 
the Free Software Foundation; either version 2 of the License, or 
(at your option) any later version.

OGen is distributed in the hope that it will be useful, 
but WITHOUT ANY WARRANTY; without even the implied warranty of 
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the 
GNU General Public License for more details.

You should have received a copy of the GNU General Public License 
along with OGen; if not, write to the

	Free Software Foundation, Inc., 
	59 Temple Place, Suite 330, 
	Boston, MA 02111-1307 USA 

							- or -

	http://www.fsf.org/licensing/licenses/gpl.txt

*/
#endregion
using System;

namespace OGen.UTs.howtos {
	public class SomeClass : IDisposable { // PascalCasing
		#region public SomeClass(...);
		public SomeClass(
			int someProperty_in // camelCasing
		) {
			somerarelyusedproperty__ = null;
			someproperty_ = someProperty_in;
		}
		#endregion
		#region ~SomeClass();
		~SomeClass() {
			cleanUp();
		}
		public void Dispose() {
			System.GC.SuppressFinalize(this);
			cleanUp();
		}
		private void cleanUp() {
			// some code...
			if (somerarelyusedproperty__ != null)
				somerarelyusedproperty__.Dispose();
		}
		#endregion

		#region private properties...
		private int someotherproperty_; // lowercasing_
		#endregion
		#region public Properties...
		#region public int SomeProperty { get; set; }
		private int someproperty_; // lowercasing_

		public int SomeProperty { // PascalCasing
			get { return someproperty_; }
			set { someproperty_ = value; }
		}
		#endregion
		#region public SomeBigResourceConsumerClass SomeRarelyUsedProperty { get; }
		private SomeBigResourceConsumerClass somerarelyusedproperty__; // lowercasing__

		public SomeBigResourceConsumerClass SomeRarelyUsedProperty { // PascalCasing
			get {
				if (somerarelyusedproperty__ == null) {
					// instantiating for the first time and
					// only because it became needed, otherwise
					// never instantiated...
					somerarelyusedproperty__ = new SomeBigResourceConsumerClass();
				}
				return somerarelyusedproperty__;
			}
		}
		#endregion
		#endregion

		#region private methods...
		#region private void someothermethod(...);
		private void someothermethod() { // lowercasing
			// some code...
		}
		#endregion
		#endregion
		#region public Methods...
		#region public int SomeMethod(...);
		private void somemethod_aux() {
			// some code...
		}

		public int SomeMethod( // PascalCasing
			int someParameter_in, // camelCasing
			out int someOtherParameter_out // camelCasing
		) {
			int SomeMethod_out = 0;
			char _auxvar; // _lowercasing

			// some code...
			someOtherParameter_out = 0;
			// some more code...

			return SomeMethod_out;
		}
		#endregion
		#endregion
	}

	public class SomeBigResourceConsumerClass : IDisposable { // PascalCasing
		public SomeBigResourceConsumerClass() {
			// some code...
		}
		public void Dispose() {
			// some code...
		}
	}
}
