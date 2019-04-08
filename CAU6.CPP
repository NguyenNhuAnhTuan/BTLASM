#include <stdio.h>
#include <conio.h>
#include <stdlib.h>
extern TYPEMORE();
extern LT();
extern VRAM();
void begin(){
	clrscr();
	    printf("\n  ____________________________________________ ");
        printf("\n |                                            |");
        printf("\n |          TRUONG DAI HOC MO HA NOI          |");
        printf("\n |          Khoa Cong nghe thong tin          |");
        printf("\n |        ------------oOOo------------        |");
        printf("\n |         BTL MON LAP TRINH HE THONG         |");
        printf("\n |     Sinh vien thuc hien:                   |");
        printf("\n |          1.Doan Ngo Hieu - 17A2            |");
        printf("\n |          2.Le Ngoc Diep - 17A1             |");
        printf("\n |          3.Nguyen Nhu Anh Tuan - 16A4      |");
        printf("\n |____________________________________________|");
}
void main()
{
	char tiep_tuc, op;
	int option;
	begin();
	printf("\n Co bat dau vao chuong trinh khong (c/k): ");
	tiep_tuc = getch();
	while (tiep_tuc == 'c'){
		clrscr();
		printf("\n  ____________________________________________ ");
		printf("\n |                                            |");
		printf("\n |        CAC CHUC NANG CUA BAI TAP LON       |");
		printf("\n |        -------------***-------------       |");
		printf("\n |                                            |");
		printf("\n |        1. Chuc nang type|more              |");
		printf("\n |        2. Tinh bieu thuc a luy thua n      |");
		printf("\n |        3. Dia chi co so cua VIDEORAM       |");
		printf("\n |        4. Thoat ve DOS                     |");
	    printf("\n |____________________________________________|");
        printf("\n Chon phim tuong ung voi chuc nang:");
	    op = getch();
        option = (int)op - 48;
        switch (option){
            case 1: {
                TYPEMORE();
                printf("\n An phim bat ky de ve Main menu... ");
                getch();
                continue;
            }
            case 2: {
                LT();
                printf("\n An phim bat ky de ve Main menu... ");
                getch();
                continue;
            }
            case 3: {
                VRAM();
                printf("\n An phim bat ky de ve Main menu... ");
                getch();
                continue;
            }
            case 4: {
                clrscr();
                exit(0);
            }
            default: {
            	printf("\n Chon sai phim chuc nang! Xin moi chon lai ");
            }
        }
	}
	clrscr();
}
