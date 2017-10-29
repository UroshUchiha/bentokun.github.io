var r, w: text;
    t, fn: unicodestring;
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

                        ppos:=pos('P00', t);

                        if (ppos <> 0) then
                        begin
                                //Copy exam name
                                fn:=copy(t, ppos, 6);

                                readln(r, t);

                                if (pos('```', t) <> 0)and (length(t) > 3) then
                                begin
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
                        end;
                end;
        end;
end.
