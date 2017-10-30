---
layout: page
comments: true
---

--------------
# CODEFUN CHEATSHEET
#### - [Qs](https://goo.gl/o4KxyV): Questions
#### - [Word version](https://github.com/bentokun/bentokun.github.io/raw/master/files/codefun/codefun_cheatsheet.docx): The Word Version
#### - [Source codes: pas, cpp](https://github.com/bentokun/bentokun.github.io/raw/master/files/codefun/answergen.rar): Answers to given exams stored in programming language files

---------------
# GENERATE SOURCE CODE (.PAS, .CPP, .C) FROM CHEATSHEET
- To generate source code from cheatsheet, we use the generator.
	* I wrote a generator in traditional Pascal, which allows you to generate source files depends on the markdown
	* [Source code of the generator](https://github.com/bentokun/bentokun.github.io/raw/master/files/codefun/codefunanswergen.pas): Modify it, no depency
	* [Compied](https://github.com/bentokun/bentokun.github.io/raw/master/files/codefun/codefunanswergen.exe): First parameter is the cheatsheet dir
	* [Raw cheatsheet](https://github.com/bentokun/bentokun.github.io/raw/master/projects/codefun.md): In markdown
- For eg: codefunanswergen.exe codefun.md (in the same dir) 

-------------

# GENERATE WORD VERSION FROM CHEATSHEET
- If you have a copy of Word installed, you can generate a word version of the cheatsheet for your self
- A generator written in C# is used to do this
	* [Source code of the generator](https://github.com/bentokun/bentokun.github.io/raw/master/files/codefun/codefunwordgen.cs): Modify it, no depency
	* [Compied](https://github.com/bentokun/bentokun.github.io/raw/master/files/codefun/codefunwordgen.exe):
		+ Last parameter is the cheatsheet dir
		+ Options:
			@ -s: Specify save location, with next parameter as the save dir
	* [Raw cheatsheet](https://github.com/bentokun/bentokun.github.io/raw/master/projects/codefun.md): In markdown
	* To jump to specific exam, use document map in View menu
	* ![document_map](https://github.com/bentokun/bentokun.github.io/raw/master/assets/codefungen.png)
	

-------------

#### - Contents:

<div class="row">
<div class="column">
<a href="#p00001">P00001</a>
* <a href="#p00002">P00002</a>
* <a href="#p00003">P00003</a>
* <a href="#p00004">P00004</a>
* <a href="#p00005">P00005</a>
* <a href="#p00006">P00006</a>
* <a href="#p00007">P00007</a>
* <a href="#p00008">P00008</a>
* <a href="#p00009">P00009</a>
* <a href="#p00012">P00012</a>
* <a href="#p00013">P00013</a>
* <a href="#p00014">P00014</a>
* <a href="#p00015">P00015</a>
* <a href="#p00016">P00016</a>
* <a href="#p00017">P00017</a>
* <a href="#p00018">P00018</a>
* <a href="#p00019">P00019</a>
* <a href="#p00020">P00020</a>
* <a href="#p00021">P00021</a>
* <a href="#p00022">P00022</a>
* <a href="#p00011">P00011</a>
* <a href="#p00028">P00028</a>
* <a href="#p00232">P00232</a>
* <a href="#p00804">P00804</a> 
* <a href="#java">java</a>
</div>
<div class ="column">
<a href="#p00025">P00025</a>
* <a href="#p00026">P00026</a>
* <a href="#p00032">P00032</a>
* <a href="#p00033">P00033</a>
* <a href="#p00105">P00105</a>
* <a href="#p00107">P00107</a>
* <a href="#p00108">P00108</a>
* <a href="#p00203">P00203</a>
* <a href="#p00204">P00204</a>
* <a href="#p00205">P00205</a>
* <a href="#p00206">P00206</a>
* <a href="#p00221">P00221</a>
* <a href="#p00222">P00222</a>
* <a href="#p00223">P00223</a>
* <a href="#p00224">P00224</a>
* <a href="#p00225">P00225</a>
* <a href="#p00229">P00229</a>
* <a href="#p00234">P00234</a>
* <a href="#p00240">P00240</a>
* <a href="#p00402">P00402</a>
* <a href="#p00403">P00403</a>
* <a href="#p00404">P00404</a>
* <a href="#p00405">P00405</a>
* <a href="#p00406">P00406</a>
* <a href="#p00407">P00407</a>
* <a href="#p00027">P00027</a>
* <a href="#p00028">P00029</a>
* <a href="#p00031">P00031</a>
</div>
</div>  

------------

## P00001
```pascal
var a: integer;

begin
    readln(a);
    writeln(a * 2);
end.
```
## P00002
```pascal
var a, b, c: integer;

begin
    readln(a,b,c);
    writeln((a-b)*c);
end.
```
## P00003
```pascal
uses sysutils;

var c: char;

begin
    readln(c);
    writeln(LowerCase(c));
end.
```
## P00004
```pascal
var n: Int64;

begin
    readln(n);

    writeln(n - (n-1) div 2 - 1);
end.
```
## P00005
```c
#include <iostream>

int main(){
    int n = 0;
    
    std::cin >> n;
    
    if (2*n < n + 1) {
        std::cout << "0" << std::endl;
    }
    else
    {
        std::cout << (n*n - n);
    }
}
```
## P00006
```pascal
var s, sn: string;
    i: integer;

begin
    readln(s);
    for i:=1 to length(s) do
    begin
        insert(s[i], sn, 1);
    end;
    
    writeln(sn);
end.
```
## P00007
```pascal
var a,b:integer;
begin
        readln(a,b);
        writeln(a+b+a*b);
end.
```
## P00008
```pascal
uses sysutils;

var c: char;

begin
    readln(c);
    writeln(UpperCase(c));
end.
```
## P00009
```pascal
var a: char;
    n: integer;
    
begin
    readln(a, n);
    
    if (ord(a) + n) > 122 then
    begin
        writeln(chr((ord(a) + n) mod 122 + 96));
    end
    else
        writeln(chr(ord(a) + n));
end.
```
## P00010
```pascal
uses sysutils;

var a: char;
    
begin

    readln(a);
    if (a <> 'Z') then
        writeln(chr(ord(LowerCase(a)) + 1));
    
end.

```
## P00011
```c
#include <iostream>
#include <cmath>

int main () {
    float a, b, c;
    
    std::cin >> a >> b >> c;
    
    float p = (a + b + c) / 2;
    
    if ((a + b > c) && (b + c > a) && (a + c > b))
        std::cout << sqrt(p * (p-a) * (p-b) * (p - c)) << std::endl;
}
```

## P00012
```pascal
var n, m, i, j: integer;

begin
    readln(n, m);
    
    for i:=1 to n do
    begin
        for j:=1 to m do
            write('#');
            
        writeln;
    end;
end.
```
## P00013
```pascal
var n, i: integer;
    t: Int64;

begin
    readln(n);
    t:=1;
    for i:=1 to n do
        t:=t*i;
        
    writeln(t);
end.
```
## P00014
```pascal
var a, t, b: char;

begin
    readln(a, t, b);
    
    if (ord(b) > ord(a)) then
        writeln(ord(b)- ord(a) - 1)
    else
        writeln(0);
end.
```
## P00015
```pascal
var s: string;
    i: longint;

begin
    readln(s);
    write(s);
    
    for i:=length(s) downto 1 do
    begin
        write(s[i]);
    end;
end.
```
## P00016
```pascal
var c: char;

begin
    readln(c);
    write(c);
    write(c);
    write(c);
    write(c);
    write(c);
    write(c);
    write(c);
    write(c);
    write(c);
    write(c);
end.
```
## P00017
```pascal
var a, b, c: Int64;

begin
    readln(a, b, c);
    
    if ((a+ b > c) and (b+c>a) and (a+c > b)) then
        writeln('YES')
    else
        writeln('NO');
end.
```
## P00018
```pascal
var n, i: integer;
    a: array[1..2000] of longint;
    
begin
    readln(n);
    for i:=1 to n do
        readln(a[i]);
        
    writeln(a[1]);
    writeln(a[n]);
end.
```
## P00019
```pascal
var a: Int64;

begin
    while (a<>19) do readln(a);
    writeln(19);
end.
```

## P00020
```pascal
uses sysutils;

var s: string;

begin
    readln(s);
    writeln(UpperCase(s[5]),' ',UpperCase(s[9]));
end.

```
## P00021
```pascal
var n, i, j: longint;

begin
    readln(n);
    for i:=1 to n do
    begin
        for j:=1 to n - i + 1 do
            write('*');
            
        writeln;
    end;
end.

```
## P00022
```pascal
var n: longint;

begin
    readln(n);
    writeln(n*n);
end.

```
## P00025
```pascal
var s: string;

begin
    readln(s);
    writeln(s,' ',s);
end.
```
## P00026
```pascal
var a, b, c, max: longint;

begin
    readln(a, b, c);
    
    if (a > b) then max:= a else max:=b;
    if (c > max) then max:=c;
    
    if (max = c) then
    begin
        if (a > b) then
            writeln(b, a, c)
        else
            writeln(a, b, c);
    end
    else if (max = b) then
     begin
        if (a > c) then
            writeln(c, a, b)
        else
            writeln(a, c, b);
    end
    else
     begin
        if (b > c) then
            writeln(c, b, a)
        else
            writeln(b, c, a);
    end
end.
```
## P00027
```pascal
var n, i: integer;

label l;

begin
    readln(n);
    
    for i:=2 to trunc(sqrt(n)) do
    begin
        if n mod i = 0 then
        begin
            writeln(i);
            goto l;
        end;
    end;
    
    writeln('YES');
    
    l:
end.
```
## P00028
```pascal
var i, t, n, k: integer;

begin
    readln(n, k);
    
    {
    for i:=1 to n do
    begin
        t:= t + i * i;
    end;
    
    t:= t + ((1 + n) * n) div 2  * k;
    
    writeln(t);}
    
    for i:=1 to n do
    begin
        t:= t + i*(i+k);
    end;
    
    writeln(t);
end.
```
## P00029
```c++
#include <stdio.h>
#include <iostream>
 
void input(double &a,double &b,double &c)
{
    std::cin >> a >> b >> c;

    if (c < a) a -= c = -(c -= a += c);
    if (c < b) b -= c = -(c -= b += c);
    if( b < a) a -= b = -(b -= a += b);
}
 
int trigon(double a,double b,double c)
{
    a = a*a + b*b; c = c*c;
    if (a > c) return 1;
    if (a == c) return 0;
    return 2;
}
 
int main()
{
    double a, b, c;
    input(a,b,c);
    std::cout << trigon(a, b, c) << std::endl;
    
    return 0;
}
```
## P00031
```pascal
var n: longint;

begin
    readln(n);
    writeln(n * (n-1) * (n-2) div 6);
end.
```
## P00032
```pascal
var s, st: string;
    i: longint;
    
begin
    readln(s);
    
    for i:=1 to length(s) do
    begin
        st := Copy(s, 1, i);
        writeln(st);
    end;
    
    for i:=length(s) downto 1 do
    begin
        st := Copy(s, 1, i);
        writeln(st);
    end;
end.
```
## P00033
```pascal
var n, k, q, r: integer;

label l;

begin
    readln(n, k);
    
    for q:= 0 to round(n / k) do
    begin
        r:= n - q * k;
        if (k>r) and (r >= 0) then
        begin
            writeln(q+r);
            goto l;
        end;
    end;
    
    writeln(0);
    
    l:

end.
```
## P00105
```pascal
var n: longint;

begin
    readln(n);
    
    if (n mod 400 = 0) then
        writeln(1)
    else 
        writeln(0);
end.
```
## P00107

```pascal
var x1, y1, x2, y2, x3, y3: Int64;
    d1, d2, d3: real;
    
begin
    readln(x1, y1, x2, y2, x3, y3);
    
    d1 := sqrt((x1 -x2) * (x1 - x2) + (y1-y2)*(y1-y2));
    d2 := sqrt((x1 -x3) * (x1 - x3) + (y1-y3)*(y1-y3));
    d3 := sqrt((x3 -x2) * (x3 - x2) + (y3-y2)*(y3-y2));
    
    if ((d1 + d2 = d3) or (d1 + d3 = d2) or (d2 + d3 = d1)) then
        writeln(1)
    else
        writeln(0);
end.

```
## P00108
```pascal
var a, b: Int64;

begin
    readln(a, b);
    if (a>b) then
        writeln('YES')
    else
        writeln('NO');
end.
```
## P00203
```pascal
var n, f,i: longint;
    a: array[1..10000] of longint;
    found: boolean;

begin
        readln(n);
        for i:=1 to n do
                read(a[i]);

        readln;
        readln(f);

        found:=false;

        for i:=1 to n do
                if (a[i] = f) then
                        found:=true;

        if (found) then writeln(1) else writeln(0);

        //readln;
end.
```
## P00204
```pascal
var n, i: longint;

function prime(n: longint): boolean;
var i: longint;
begin
        for i:=2 to trunc(sqrt(n)) do
        begin
                if n mod i = 0 then
                        exit(false);
        end;

        exit(true);
end;
        //readln;

begin
        readln(n);
        for i:=2 to n-1 do
        begin
                if prime(i) then
                begin
                        write(i,' ');
                end;
        end;

        //readln;
end.
```
## P00205
```pascal
var n, i: longint;

begin
        readln(n);

        for i:=1 to n do
        begin
                if n mod i = 0 then
                        write(i,' ');
        end;

        //readln;
end.
```
## P00206
```pascal
var n, i: longint;
    prime: boolean;

begin
        readln(n); prime:= true;

        if (n<2) then prime:=false else

        for i:=2 to trunc(sqrt(n)) do
              if (n mod i = 0) then
                prime:= false;

        if prime then writeln(1) else writeln(0);

        readln;
end.
```
## P00221
```pascal
var n: longint;

begin
    readln(n);
    writeln((1+n)*n div 2);
end.
```
## P00222
```pascal
var n: longint;

begin
    readln(n);
    writeln(((n div 2 * 2) + 2) * (((n div 2 * 2) - 2) div 2 + 1) div 2);
end.
```
## P00223
```pascal
var n: longint;

begin
    readln(n);
    writeln((n + (n mod 2)) * ((n + n mod 2 - 2) div 2 + 1) div 2);
end.
```
## P00224
```pascal
var n, i, j: longint;

begin
    readln(n);
    
    for i:=1 to n do
    begin
        for j:=1 to n do
            write(n,' ');
            
        writeln;
    end;
end.
```
## P00225
```pascal
var m, n, i, j: longint;

begin
    readln(n,m);
    
    for i:=1 to n do
    begin
        for j:=1 to m do
        begin
            write('# ');
        end;
        
        writeln;
    end;
end.
```
## P00229
```pascal
var n, m, i, j: integer;

begin
    readln(n, m);
    for i:=1 to n do
    begin
        for j:= 1 to n do
            write(m,' ');
        
        writeln;
    end;
end.
```
## P00232
```pascal
var s: string;

begin
    readln(s);
    writeln(length(s) - 1);
end.
```
## P00234
```pascal
var i, n, m: longint;

begin
    readln(n, m);
    for i:=1 to n do
    begin
        if (i mod m = 0) then
            writeln(i);
    end;
end.
```
## P00240
```pascal
var a: longint;

begin
    readln(a);
    writeln(a*a);
end.
```
## P00401
```pascal
var s: string;

begin
        readln(s);
        writeln(length(s));
end.

```
## P00402
```pascal
var s: string;
    i,c: longint;

begin
        readln(s);

        if (s[1]<>' ') and (ord(s[1]) <> 0) then inc(c);

        for i:=1 to length(s) do
        begin
                if ((s[i] = ' ') and ((s[i+1] <> ' ') and (ord(s[i+1]) <> 0))) then
                begin
                        c:=c+1;

                end;
        end;

        writeln(c);
        //readln;
end.
```
## P00403
```pascal
uses sysutils;

var s:string;
    m, i,j:integer;
    cc:array[1..200] of longint;
    c:array[1..200] of char;

begin
        readln(s);
        readln(m);

        for i:=1 to m do
                readln(c[i]);

        for i:=1 to length(s) do
        begin
                for j:=1 to m do
                begin
                        if (s[i]= c[j]) then
                                inc(cc[j]);
                end;
        end;

        for i:=1 to m do
                writeln(cc[i]);
end.
```
## P00404
```pascal
uses sysutils;

var a: array[1..30] of char;
    c, i, j: integer;
    s: string;
    loop: boolean;

begin
    readln(s);
    c:=1;

    for i:=1 to length(s) do
    begin
        loop:=false;

        if ((s[i] in ['a'..'z']) or (s[i] in ['A' .. 'Z'])) then
        begin
            for j:=1 to c do
                if (a[j] = LowerCase(s[i])) then loop:=true;

            if (loop <> true) then
            begin
                a[c] := LowerCase(s[i]);
                c:=c+1;
            end;

        end;
    end;

    if (c>=26) then writeln('YES') else writeln('NO');

end.
```
## P00405
```pascal
var s: string;
    i: integer;
    not_pand: boolean;

begin
        readln(s);

        not_pand:= false;

        for i:=1 to length(s) do
        begin
                if (s[i] <> s[length(s) - i + 1]) then
                        not_pand:= true;
        end;

        if (not_pand) then write('NO') else writeln('YES');

        readln;
end.
```
## P00406
```pascal
var pass: string;
    upper_cased, lower_cased, numbered, least_count,invaild: boolean;
    i: longint;
    
begin
    readln(pass);
    
    upper_cased := false;
    lower_cased := false;
    numbered := false;
    invaild := false;
    
    if (length(pass) < 8) then
        least_count:= false
    else
        least_count:= true;
    
    for i:=1 to length(pass) do
    begin
        if (pass[i] in ['A'..'Z']) then
            upper_cased := true
        else if (pass[i] in ['a'..'z']) then
            lower_cased:=true
        else if (pass[i] in ['0'..'9']) then
            numbered := true
        else
            invaild := true;
    end;
    
    if (invaild) then
        writeln('Invalid')
    else if ((numbered) and (upper_cased) and (lower_cased) and (least_count)) then
        writeln('Strong')
    else
        writeln('Weak');
end.
```
## P00407
```pascal

var c, i, j, k: longint;
    s1, s2: string;
    a: array [1..1000] of char;
    found: boolean;
    
begin
    readln(s1);
    readln(s2);
    
    for i:=1 to length(s1) do
        for j:=1 to length(s2) do
        begin
            found:=false;
        
            if (s1[i] = s2[j]) then
            begin
                for k:=1 to c do
                    if (a[k] = s1[i]) then
                        found:=true;
                        
                if (found = false) then
                begin
                    c:=c+1;
                    a[c] := s1[i];
                end;
            end;
        end;
        
    writeln(c);
    
end.

```
## P00804
```pascal
var x, n, i: longint;
    t: Int64;

begin
    readln(x, n);
    t:=1;
    
    for i:=1 to n do
    begin
        t:=t*x;
    end;
    
    writeln(t);
end.
```
## java
```pascal
var a, b: longint;

begin
    readln(a,b);
    writeln(a+b);
end.
```