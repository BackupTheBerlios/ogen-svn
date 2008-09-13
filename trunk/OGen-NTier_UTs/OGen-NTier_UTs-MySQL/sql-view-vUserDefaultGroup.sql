USE `OGen-NTier_UTs`;

DROP view `vUserDefaultGroup`;

CREATE view `vUserDefaultGroup` AS
/*

OGen
Copyright (c) 2002 Francisco Monteiro

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/
	SELECT
		t2.`IDUser`, 
		t2.`Login`, 
		t3.`IDGroup`, 
		t3.`Name`, 
		t1.`Relationdate`
	FROM `UserGroup` t1
		JOIN `User` t2 ON (t2.`IDUser` = t1.`IDUser`)
		JOIN `Group` t3 ON (t3.`IDGroup` = t1.`IDGroup`)
	WHERE t1.`Defaultrelation` = 1;