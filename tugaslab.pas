program rental_ps_kece;
uses crt;

type
    customer = record
        nama : string;
        jam : integer;
        biaya : longint;
    end;

var
    data : array[1..50] of customer;
    pilihan, player : integer;



function HitungBiaya(jam: integer): longint;
begin
    HitungBiaya := jam * 5000;   
end;


procedure InputCustom(var dta: array of customer; var player: integer);
begin
    player := player + 1;
    writeln;
    write('Nama customer : '); readln(dta[player].nama);
    write('Lama rental (jam): '); readln(dta[player].jam);

    dta[player].biaya := HitungBiaya(dta[player].jam);

    writeln('Data berhasil ditambah!');
    readln;
end;

procedure TampilData(dat4: array of customer; player: integer);
var
    i: integer;
begin
    clrscr;
    writeln('===== DATA PERENTAL =====');
    if player = 0 then
    begin
        writeln('Belum ada bocil.');
    end
    else
    begin
        for i := 1 to player do
        begin
            writeln('Penyewa ke-', i);
            writeln('Nama  : ', dat4[i].nama);
            writeln('Jam   : ', dat4[i].jam);
            writeln('Biaya : Rp', dat4[i].biaya);
            writeln;
        end;
    end;
    readln;
end;

procedure CariBocilBiadab(d4ta: array of customer; player: integer);
var
    namaCari: string;
    i: integer;
    ketemu: boolean;
begin
    clrscr;
    write('Cari nama perental : ');
    readln(namaCari);

    ketemu := false;

    for i := 1 to player do
    begin
        if d4ta[i].nama = namaCari then
        begin
            ketemu := true;
            writeln('Data ditemukan!');
            writeln('Nama  : ', d4ta[i].nama);
            writeln('Jam   : ', d4ta[i].jam);
            writeln('Biaya : Rp', d4ta[i].biaya);
        end;
    end;

    if not ketemu then
        writeln('Data tidak ditemukan.');

    readln;
end;

begin
    clrscr;
    player := 0;

    repeat
        clrscr;
        writeln('===== MENU RENTAL PS =====');
        writeln('1. Input Perental');
        writeln('2. Tampilkan Data');
        writeln('3. Cari Perental');
        writeln('4. Keluar');
        write('Pilih menu: ');
        readln(pilihan);

        case pilihan of
            1: InputCustom(data, player);
            2: TampilData(data, player);
            3: CariBocilBiadab(data, player);
        end;

    until pilihan = 4;

    writeln('Program selesai.');
end.