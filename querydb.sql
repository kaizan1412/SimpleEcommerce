create table MstCustomer(
	idCustomer int identity(1,1) primary key not null,
	namaCustomer nvarchar(255) not null,
	alamatCustomer nvarchar(255) not null,
	teleponCustomer nvarchar(15) null,
);

create table MstProduk(
	idProduk int identity(1,1) primary key not null,
	namaProduk nvarchar(255) not null,
	deskripsiProduk nvarchar(255) not null,
	hargaProduk decimal(18,2) not null,
	stok int not null
);

create table TrOrderHeader(
	idOrderHeader nvarchar(10) primary key not null,
	idCustomer int not null,
	tanggalOrder datetime not null,
	total decimal(18,2) not null,
	constraint fk_order_customer foreign key(idCustomer) references MstCustomer(idCustomer)
);

create table TrOrderDetail(
	idOrderDetail nvarchar(10) primary key not null,
	idOrderHeader nvarchar(10) not null,
	idProduk int not null,
	quantity int not null,
	subtotal decimal(18,2) not null,
	constraint fk_detail_header foreign key(idOrderHeader) references TrOrderHeader(idOrderHeader),
	constraint fk_detail_produk foreign key(idProduk) references MstProduk(idProduk)
)

insert into MstCustomer values('John Doe', 'Depok', '12345'),('Jon Snow','Jakarta','54321'),('Jon Carry','Bogor', '13425');
insert into MstProduk values('Odol', 'Odol untuk semua kalangan',15000.0,100),('Shampoo', 'Shampoo anti ketombe dan rambut rontok',25000.0,100),('Sikat Gigi', 'Sikat gigi dengan teknologi mutakhir',115000.0,100);
insert into TrOrderHeader values('TH001',1,GETDATE(),400000.0);
insert into TrOrderDetail values('TD001','TH001',1,2,30000.0);
insert into TrOrderDetail values('TD002','TH001',2,1,25000.0);
insert into TrOrderDetail values('TD003','TH001',3,3,345000.0);
