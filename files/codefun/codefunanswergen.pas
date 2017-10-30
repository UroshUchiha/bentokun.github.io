var r, w: text;
    t, fn, lt: unicodestring;
    ppos: Int64;

begin
        if (paramcount < 1) then
        begin
                writeln('File not specified.');
        end
        else
        begin
                assign(r, paramstr(paramcount)); reset(r);

                while not eof(r) do
                begin
                        readln(r,  t);

                        if (t = '') then
                                t:=lt
                        else
                        begin

                          if (pos('```', t) <> 0)and (length(t) > 3) then
                          begin
                                        fn:=lt;

                                        while ((fn[1] = '#') or (fn[1]=' ')) and (length(fn) >0) do
                                        begin
                                                delete(fn,1,1);
                                        end;

                                        //Define type
                                        if (t='```pascal') then
                                                assign(w, fn + '.pas')
                                        else if (t='```c') or (t='```c++') then
                                                assign(w, fn + '.cpp');

                                        rewrite(w);

                                        readln(r, t);

                                        while (t <> '```') do
                                        begin
                                                writeln(w, t);
                                                readln(r, t);
                                        end;

                                        close(w);
                          end;

                          lt:=t;
                        end;
                end;
        end;
end.
