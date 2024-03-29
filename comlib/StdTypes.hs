-- Automatically generated by HaskellDirect (ihc.exe), version 0.20
-- Created: 20:11 Pacific Standard Time, Tuesday 16 December, 2003
-- Command line: -fno-qualified-names -fno-export-list -fno-gen-variant-instances -fout-pointers-are-not-refs --gen-headers -c StdTypes.idl -o StdTypes.hs

module StdTypes where

import Prelude
import Com (IID, CLSID, GUID)
import Foreign.Ptr (Ptr)
import HDirect (Wchar_t)
import Int (Int32, Int16)
import WideString (WideString)
import Word (Word32, Word16)

{- BEGIN_C_CODE
#ifdef __MINGW32__
END_C_CODE-}
{- BEGIN_C_CODE
#define __need_wchar_t
END_C_CODE-}
{- BEGIN_C_CODE
#include <stddef.h>
END_C_CODE-}
{- BEGIN_C_CODE
#endif
END_C_CODE-}
type UINT = Word32
type INT = Int32
type BOOL = Int32
type BYTE = Char
type LONG = Int32
type ULONG = Word32
type WORD = Word16
type DWORD = Word32
type VARTYPE = Word16
type USHORT = Word16
type LCID = DWORD
type SCODE = LONG
type SHORT = Int16
type WCHAR = Wchar_t
type TCHAR = WCHAR
type OLECHAR = WCHAR
type LPOLESTR = WideString
type LPCOLESTR = WideString
type PVOID = Ptr ()
type LPVOID = Ptr ()
type FLOAT = Float
{- BEGIN_C_CODE
typedef struct _GUID {
END_C_CODE-}
{- BEGIN_C_CODE
DWORD Data1;
END_C_CODE-}
{- BEGIN_C_CODE
WORD  Data2;
END_C_CODE-}
{- BEGIN_C_CODE
WORD  Data3;
END_C_CODE-}
{- BEGIN_C_CODE
BYTE  Data4[8];
END_C_CODE-}
{- BEGIN_C_CODE
} GUID;
END_C_CODE-}
{- BEGIN_C_CODE
typedef GUID IID;
END_C_CODE-}
type LPIID = IID ()
{- BEGIN_C_CODE
typedef GUID CLSID;
END_C_CODE-}
type LPCLSID = CLSID
type FMTID = GUID
type LPFMTID = GUID
type HWND = Ptr ()
type HMENU = Ptr ()
type HANDLE = Ptr ()
type REFGUID = GUID
type REFIID = IID ()
type REFCLSID = CLSID
type REFFMTID = GUID
data VARENUM
 = VT_EMPTY
 | VT_NULL
 | VT_I2
 | VT_I4
 | VT_R4
 | VT_R8
 | VT_CY
 | VT_DATE
 | VT_BSTR
 | VT_DISPATCH
 | VT_ERROR
 | VT_BOOL
 | VT_VARIANT
 | VT_UNKNOWN
 | VT_DECIMAL
 | VT_I1
 | VT_UI1
 | VT_UI2
 | VT_UI4
 | VT_I8
 | VT_UI8
 | VT_INT
 | VT_UINT
 | VT_VOID
 | VT_HRESULT
 | VT_PTR
 | VT_SAFEARRAY
 | VT_CARRAY
 | VT_USERDEFINED
 | VT_LPSTR
 | VT_LPWSTR
 | VT_FILETIME
 | VT_BLOB
 | VT_STREAM
 | VT_STORAGE
 | VT_STREAMED_OBJECT
 | VT_STORED_OBJECT
 | VT_BLOB_OBJECT
 | VT_CF
 | VT_CLSID
 | VT_BSTR_BLOB
 | VT_ILLEGALMASKED
 | VT_TYPEMASK
 | VT_VECTOR
 | VT_ARRAY
 | VT_BYREF
 | VT_RESERVED
 | VT_ILLEGAL
 
instance Enum (VARENUM) where
  fromEnum v =
    case v of
       VT_EMPTY -> 0
       VT_NULL -> 1
       VT_I2 -> 2
       VT_I4 -> 3
       VT_R4 -> 4
       VT_R8 -> 5
       VT_CY -> 6
       VT_DATE -> 7
       VT_BSTR -> 8
       VT_DISPATCH -> 9
       VT_ERROR -> 10
       VT_BOOL -> 11
       VT_VARIANT -> 12
       VT_UNKNOWN -> 13
       VT_DECIMAL -> 14
       VT_I1 -> 16
       VT_UI1 -> 17
       VT_UI2 -> 18
       VT_UI4 -> 19
       VT_I8 -> 20
       VT_UI8 -> 21
       VT_INT -> 22
       VT_UINT -> 23
       VT_VOID -> 24
       VT_HRESULT -> 25
       VT_PTR -> 26
       VT_SAFEARRAY -> 27
       VT_CARRAY -> 28
       VT_USERDEFINED -> 29
       VT_LPSTR -> 30
       VT_LPWSTR -> 31
       VT_FILETIME -> 64
       VT_BLOB -> 65
       VT_STREAM -> 66
       VT_STORAGE -> 67
       VT_STREAMED_OBJECT -> 68
       VT_STORED_OBJECT -> 69
       VT_BLOB_OBJECT -> 70
       VT_CF -> 71
       VT_CLSID -> 72
       VT_BSTR_BLOB -> 4095
       VT_ILLEGALMASKED -> 4095
       VT_TYPEMASK -> 4095
       VT_VECTOR -> 4096
       VT_ARRAY -> 8192
       VT_BYREF -> 16384
       VT_RESERVED -> 32768
       VT_ILLEGAL -> 65535
  
  toEnum v =
    case v of
       0 -> VT_EMPTY
       1 -> VT_NULL
       2 -> VT_I2
       3 -> VT_I4
       4 -> VT_R4
       5 -> VT_R8
       6 -> VT_CY
       7 -> VT_DATE
       8 -> VT_BSTR
       9 -> VT_DISPATCH
       10 -> VT_ERROR
       11 -> VT_BOOL
       12 -> VT_VARIANT
       13 -> VT_UNKNOWN
       14 -> VT_DECIMAL
       16 -> VT_I1
       17 -> VT_UI1
       18 -> VT_UI2
       19 -> VT_UI4
       20 -> VT_I8
       21 -> VT_UI8
       22 -> VT_INT
       23 -> VT_UINT
       24 -> VT_VOID
       25 -> VT_HRESULT
       26 -> VT_PTR
       27 -> VT_SAFEARRAY
       28 -> VT_CARRAY
       29 -> VT_USERDEFINED
       30 -> VT_LPSTR
       31 -> VT_LPWSTR
       64 -> VT_FILETIME
       65 -> VT_BLOB
       66 -> VT_STREAM
       67 -> VT_STORAGE
       68 -> VT_STREAMED_OBJECT
       69 -> VT_STORED_OBJECT
       70 -> VT_BLOB_OBJECT
       71 -> VT_CF
       72 -> VT_CLSID
       4095 -> VT_BSTR_BLOB
       4095 -> VT_ILLEGALMASKED
       4095 -> VT_TYPEMASK
       4096 -> VT_VECTOR
       8192 -> VT_ARRAY
       16384 -> VT_BYREF
       32768 -> VT_RESERVED
       65535 -> VT_ILLEGAL
       _ -> error "unmarshallVARENUM: illegal enum value "
  

