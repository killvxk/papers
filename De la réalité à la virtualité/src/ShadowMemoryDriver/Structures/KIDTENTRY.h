#ifndef _KIDTENTRY_H_INCLUDED
#define _KIDTENTRY_H_INCLUDED

#ifndef KIDTENTRY_INCLUDED
#define KIDTENTRY_INCLUDED

typedef struct _KIDTENTRY
{
	USHORT	Offset;		//+0x000
	USHORT	Selector;		//+0x002
	USHORT	Access;		//+0x004
	USHORT	ExtendedOffset;		//+0x006
} KIDTENTRY, *PKIDTENTRY, **PPKIDTENTRY;


#endif //_INCLUDED
#endif//_H_INCLUDED
