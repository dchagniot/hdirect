{-# OPTIONS -#include "autoPrim.h" #-}
-- Automatically generated by HaskellDirect (ihc.exe), version 0.20
-- Created: 20:12 Pacific Standard Time, Tuesday 16 December, 2003
-- Command line: -fno-qualified-names -fno-imports -fno-export-lists -fhs-to-c -fno-overload-variant -fout-pointers-are-not-refs -fsubtyped-interface-pointers -c AutoPrim.idl -o AutoPrim.hs

module AutoPrim where



import Com (checkHR, marshallIUnknown, IUnknown, mkIID, IID, LCID)
import HDirect (Ptr, allocBytes, marshallBool, readref, readStablePtr,
                marshallPtr, readPtr, unmarshallref, trivialFree, doThenFree, free,
                sizeofInt32, readInt32, unmarshallString, freeString, sizeofInt16, 
                readInt16, sizeofDouble, readDouble, sizeofFloat, readFloat, Octet,
		readBool, sizeofChar, readChar, unmarshallBool,
		freeref, sizeofWord8, readWord8, sizeofWord32, readWord32,
		StablePtr, sizeofPtr, readPtr, writePtr, sizeofForeignPtr )
import SafeArray ( SAFEARRAY, marshallSAFEARRAY, unmarshallSAFEARRAY, readSAFEARRAY, sizeofSAFEARRAY )
import Pointer ( allocMemory )
import IOExts (unsafePerformIO)
import Int  (Int32, Int16)
import Word (Word8, Word32)
import Foreign.ForeignPtr ( ForeignPtr, withForeignPtr )
import Foreign.Ptr


data VARIANT_ = VARIANT_
type VARIANT = Ptr VARIANT_
sizeofBSTR = sizeofPtr

iidIDispatch :: IID (IDispatch ())
iidIDispatch  = mkIID "{00020400-0000-0000-C000-000000000046}"

sizeofVARIANT    :: Word32
sizeofVARIANT         = 16

marshallVARIANT   :: VARIANT -> IO VARIANT
marshallVARIANT m = return m

unmarshallVARIANT :: Ptr a -> IO VARIANT
unmarshallVARIANT v = return (castPtr v)

readVARIANT       :: Ptr VARIANT -> IO VARIANT
readVARIANT ptr = 
  readPtr ptr
--  unmarshallVARIANT ptr

writeVARIANT      :: Ptr VARIANT -> VARIANT -> IO ()
writeVARIANT ptr v = writePtr ptr v

copyVARIANT      :: VARIANT -> VARIANT -> IO ()
copyVARIANT ptr v = do
  primCopyVARIANT (castPtr ptr) (castPtr v)
  -- ToDo: if the passed in variant has a finaliser
  -- attached to it, this is the time to disable those.
  -- It doesn't at the moment, though.

allocVARIANT :: IO VARIANT
allocVARIANT = do
  x <- allocMemory (fromIntegral sizeofVARIANT)
  variantInit x
  return x

{- BEGIN_GHC_ONLY 
foreign import ccall "writeVarInt" writeVarStablePtr
   END_GHC_ONLY -}
{- BEGIN_NOT_FOR_GHC -}
primitive writeVarStablePtr "prim_AutoPrim_writeVarInt"
{- END_NOT_FOR_GHC -}
     :: StablePtr a -> Ptr (StablePtr a) -> IO ()

{- BEGIN_GHC_ONLY 
foreign import ccall "readVarInt" prim_readVarStablePtr 
   END_GHC_ONLY -}
{- BEGIN_NOT_FOR_GHC -}
primitive prim_readVarStablePtr "prim_AutoPrim_readVarInt"
{- END_NOT_FOR_GHC -}
     :: Ptr (StablePtr a) -> Ptr b -> IO Int32

readVarStablePtr :: VARIANT -> IO (StablePtr a)
readVarStablePtr p = do
    i <- allocBytes (fromIntegral sizeofInt32)
    o_readVarInt <- prim_readVarStablePtr (castPtr p) i
    checkHR o_readVarInt
    doThenFree (freeref trivialFree) (unmarshallref readStablePtr) i


type DISPID = Int32
type PEXCEPINFO = Ptr ()
-- --------------------------------------------------
-- 
-- interface IDispatch
-- 
-- --------------------------------------------------
data IDispatch_ a = IDispatch__
                      
type IDispatch a = IUnknown (IDispatch_ a)
dispatchInvoke :: IDispatch a0
               -> DISPID
               -> LCID
               -> Bool
               -> Word32
               -> Word32
               -> Word32
               -> VARIANT
               -> VARIANT
               -> IO (PEXCEPINFO, Int32)
dispatchInvoke obj dispid lcid isfunction flags cargs cargsout args argsout =
  do
    info <- allocBytes (fromIntegral sizeofPtr)
    obj <- marshallIUnknown obj
    isfunction <- marshallBool isfunction
    o_dispatchInvoke <- withForeignPtr obj (\ obj -> prim_AutoPrim_dispatchInvoke obj dispid lcid isfunction flags cargs cargsout args argsout info)
    info <- doThenFree free readPtr info
    return (info, o_dispatchInvoke)

foreign import ccall "dispatchInvoke" prim_AutoPrim_dispatchInvoke :: Ptr (IDispatch a) -> Int32 -> Word32 -> Int32 -> Word32 -> Word32 -> Word32 -> VARIANT -> VARIANT -> Ptr (Ptr ()) -> IO Int32
dispatchGetMemberID :: IDispatch a0
                    -> Ptr String
                    -> LCID
                    -> IO (DISPID, Int32)
dispatchGetMemberID obj name lcid =
  do
    dispid <- allocBytes (fromIntegral sizeofInt32)
    obj <- marshallIUnknown obj
    o_dispatchGetMemberID <- withForeignPtr obj (\ obj -> prim_AutoPrim_dispatchGetMemberID obj name lcid dispid)
    dispid <- doThenFree free readInt32 dispid
    return (dispid, o_dispatchGetMemberID)

foreign import ccall "dispatchGetMemberID" prim_AutoPrim_dispatchGetMemberID :: Ptr (IDispatch a) -> Ptr String -> Word32 -> Ptr Int32 -> IO Int32
freeExcepInfo :: PEXCEPINFO
              -> IO ()
freeExcepInfo einfo =
  prim_AutoPrim_freeExcepInfo einfo

foreign import ccall "freeExcepInfo" prim_AutoPrim_freeExcepInfo :: Ptr () -> IO ()
getExcepInfoMessage :: PEXCEPINFO
                    -> IO (Ptr Char)
getExcepInfoMessage info = prim_AutoPrim_getExcepInfoMessage info

foreign import ccall "getExcepInfoMessage" prim_AutoPrim_getExcepInfoMessage :: Ptr () -> IO (Ptr Char)
freeVariants :: Word32
             -> VARIANT
             -> IO ()
freeVariants count p =
  prim_AutoPrim_freeVariants count
                             p

foreign import ccall "freeVariants" prim_AutoPrim_freeVariants :: Word32 -> VARIANT -> IO ()
readVariantTag :: VARIANT
               -> IO Int32
readVariantTag p = prim_AutoPrim_readVariantTag p

foreign import ccall "readVariantTag" prim_AutoPrim_readVariantTag :: VARIANT -> IO Int32
variantInit :: VARIANT
            -> IO ()
variantInit p =
  prim_AutoPrim_variantInit p

foreign import stdcall "VariantInit" prim_AutoPrim_variantInit :: VARIANT -> IO ()
writeVarShort :: Int16
              -> VARIANT
              -> IO ()
writeVarShort i p =
  prim_AutoPrim_writeVarShort i
                              p

foreign import ccall "writeVarShort" prim_AutoPrim_writeVarShort :: Int16 -> VARIANT -> IO ()
readVarShort :: VARIANT
             -> IO Int16
readVarShort p =
  do
    i <- allocBytes (fromIntegral sizeofInt16)
    o_readVarShort <- prim_AutoPrim_readVarShort p i
    checkHR o_readVarShort
    doThenFree free readInt16 i

foreign import ccall "readVarShort" prim_AutoPrim_readVarShort :: VARIANT -> Ptr Int16 -> IO Int32
writeVarInt :: Int32
            -> VARIANT
            -> IO ()
writeVarInt i p =
  prim_AutoPrim_writeVarInt i
                            p

foreign import ccall "writeVarInt" prim_AutoPrim_writeVarInt :: Int32 -> VARIANT -> IO ()
readVarInt :: VARIANT
           -> IO Int32
readVarInt p =
  do
    i <- allocBytes (fromIntegral sizeofInt32)
    o_readVarInt <- prim_AutoPrim_readVarInt p i
    checkHR o_readVarInt
    doThenFree free readInt32 i

foreign import ccall "readVarInt" prim_AutoPrim_readVarInt :: VARIANT -> Ptr Int32 -> IO Int32
writeVarWord :: Word32
             -> VARIANT
             -> IO ()
writeVarWord i p =
  prim_AutoPrim_writeVarWord i
                             p

foreign import ccall "writeVarWord" prim_AutoPrim_writeVarWord :: Word32 -> VARIANT -> IO ()
readVarWord :: VARIANT
            -> IO Word32
readVarWord p =
  do
    i <- allocBytes (fromIntegral sizeofWord32)
    o_readVarWord <- prim_AutoPrim_readVarWord p i
    checkHR o_readVarWord
    doThenFree free readWord32 i

foreign import ccall "readVarWord" prim_AutoPrim_readVarWord :: VARIANT -> Ptr Word32 -> IO Int32
writeVarFloat :: Float
              -> VARIANT
              -> IO ()
writeVarFloat i p =
  prim_AutoPrim_writeVarFloat i
                              p

foreign import ccall "writeVarFloat" prim_AutoPrim_writeVarFloat :: Float -> VARIANT -> IO ()
readVarFloat :: VARIANT
             -> IO Float
readVarFloat p =
  do
    i <- allocBytes (fromIntegral sizeofFloat)
    o_readVarFloat <- prim_AutoPrim_readVarFloat p i
    checkHR o_readVarFloat
    doThenFree free readFloat i

foreign import ccall "readVarFloat" prim_AutoPrim_readVarFloat :: VARIANT -> Ptr Float -> IO Int32
writeVarDouble :: Double
               -> VARIANT
               -> IO ()
writeVarDouble i p =
  prim_AutoPrim_writeVarDouble i
                               p

foreign import ccall "writeVarDouble" prim_AutoPrim_writeVarDouble :: Double -> VARIANT -> IO ()
readVarDouble :: VARIANT
              -> IO Double
readVarDouble p =
  do
    i <- allocBytes (fromIntegral sizeofDouble)
    o_readVarDouble <- prim_AutoPrim_readVarDouble p i
    checkHR o_readVarDouble
    doThenFree free readDouble i

foreign import ccall "readVarDouble" prim_AutoPrim_readVarDouble :: VARIANT -> Ptr Double -> IO Int32
writeVarString :: Ptr Char
               -> VARIANT
               -> IO ()
writeVarString str p =
  prim_AutoPrim_writeVarString str
                               p

foreign import ccall "writeVarString" prim_AutoPrim_writeVarString :: Ptr Char -> VARIANT -> IO ()
readVarString :: VARIANT
              -> IO (Ptr (Ptr Char), Ptr VARIANT)
readVarString p =
  do
    pstr <- allocBytes (fromIntegral sizeofPtr)
    w <- allocBytes (fromIntegral sizeofVARIANT)
    o_readVarString <- prim_AutoPrim_readVarString p pstr w
    checkHR o_readVarString
    return (pstr, w)

foreign import ccall "readVarString" prim_AutoPrim_readVarString :: VARIANT -> Ptr (Ptr Char) -> Ptr VARIANT -> IO Int32
writeVarDispatch :: IDispatch a0
                 -> VARIANT
                 -> IO ()
writeVarDispatch ip p =
  do
    ip <- marshallIUnknown ip
    withForeignPtr ip (\ ip -> prim_AutoPrim_writeVarDispatch ip p)

foreign import ccall "writeVarDispatch" prim_AutoPrim_writeVarDispatch :: Ptr (IDispatch a) -> VARIANT -> IO ()
readVarDispatch :: VARIANT
                -> IO (Ptr (Ptr ()), Ptr VARIANT)
readVarDispatch p =
  do
    ip <- allocBytes (fromIntegral sizeofPtr)
    w <- allocBytes (fromIntegral sizeofVARIANT)
    o_readVarDispatch <- prim_AutoPrim_readVarDispatch p ip w
    checkHR o_readVarDispatch
    return (ip, w)

foreign import ccall "readVarDispatch" prim_AutoPrim_readVarDispatch :: VARIANT -> Ptr (Ptr ()) -> Ptr VARIANT -> IO Int32
writeVarOptional :: VARIANT
                 -> IO ()
writeVarOptional p =
  prim_AutoPrim_writeVarOptional p

foreign import ccall "writeVarOptional" prim_AutoPrim_writeVarOptional :: VARIANT -> IO ()
writeVarError :: Int32
              -> VARIANT
              -> IO ()
writeVarError err p =
  prim_AutoPrim_writeVarError err
                              p

foreign import ccall "writeVarError" prim_AutoPrim_writeVarError :: Int32 -> VARIANT -> IO ()
readVarError :: VARIANT
             -> IO Int32
readVarError p =
  do
    perr <- allocBytes (fromIntegral sizeofInt32)
    o_readVarError <- prim_AutoPrim_readVarError p perr
    checkHR o_readVarError
    doThenFree free readInt32 perr

foreign import ccall "readVarError" prim_AutoPrim_readVarError :: VARIANT -> Ptr Int32 -> IO Int32
writeVarBool :: Bool
             -> VARIANT
             -> IO ()
writeVarBool b p =
  do
    b <- marshallBool b
    prim_AutoPrim_writeVarBool b p

foreign import ccall "writeVarBool" prim_AutoPrim_writeVarBool :: Int32 -> VARIANT -> IO ()
readVarBool :: VARIANT
            -> IO Bool
readVarBool p =
  do
    pb <- allocBytes (fromIntegral sizeofInt32)
    o_readVarBool <- prim_AutoPrim_readVarBool p pb
    checkHR o_readVarBool
    doThenFree free readBool pb

foreign import ccall "readVarBool" prim_AutoPrim_readVarBool :: VARIANT -> Ptr Int32 -> IO Int32
writeVarUnknown :: IUnknown a0
                -> VARIANT
                -> IO ()
writeVarUnknown ip p =
  do
    ip <- marshallIUnknown ip
    withForeignPtr ip (\ ip -> prim_AutoPrim_writeVarUnknown ip p)

foreign import ccall "writeVarUnknown" prim_AutoPrim_writeVarUnknown :: Ptr (IUnknown a) -> VARIANT -> IO ()
readVarUnknown :: VARIANT
               -> IO (Ptr (Ptr ()), Ptr VARIANT)
readVarUnknown p =
  do
    ip <- allocBytes (fromIntegral sizeofPtr)
    w <- allocBytes (fromIntegral sizeofVARIANT)
    o_readVarUnknown <- prim_AutoPrim_readVarUnknown p ip w
    checkHR o_readVarUnknown
    return (ip, w)

foreign import ccall "readVarUnknown" prim_AutoPrim_readVarUnknown :: VARIANT -> Ptr (Ptr ()) -> Ptr VARIANT -> IO Int32
writeVarByte :: Octet
             -> VARIANT
             -> IO ()
writeVarByte b p =
  prim_AutoPrim_writeVarByte b
                             p

foreign import ccall "writeVarByte" prim_AutoPrim_writeVarByte :: Word8 -> VARIANT -> IO ()
readVarByte :: VARIANT
            -> IO Octet
readVarByte p =
  do
    pb <- allocBytes (fromIntegral sizeofWord8)
    o_readVarByte <- prim_AutoPrim_readVarByte p pb
    checkHR o_readVarByte
    doThenFree free readWord8 pb

foreign import ccall "readVarByte" prim_AutoPrim_readVarByte :: VARIANT -> Ptr Word8 -> IO Int32
writeVarEmpty :: VARIANT
              -> IO ()
writeVarEmpty p =
  prim_AutoPrim_writeVarEmpty p

foreign import ccall "writeVarEmpty" prim_AutoPrim_writeVarEmpty :: VARIANT -> IO ()
writeVarNull :: VARIANT
             -> IO ()
writeVarNull p =
  prim_AutoPrim_writeVarNull p

foreign import ccall "writeVarNull" prim_AutoPrim_writeVarNull :: VARIANT -> IO ()
readVarNull :: VARIANT
            -> IO ()
readVarNull p =
  do
    o_readVarNull <- prim_AutoPrim_readVarNull p
    checkHR o_readVarNull

foreign import ccall "readVarNull" prim_AutoPrim_readVarNull :: VARIANT -> IO Int32
writeVarCurrency :: Int32
                 -> Word32
                 -> VARIANT
                 -> IO ()
writeVarCurrency hi lo p =
  prim_AutoPrim_writeVarCurrency hi
                                 lo
                                 p

foreign import ccall "writeVarCurrency" prim_AutoPrim_writeVarCurrency :: Int32 -> Word32 -> VARIANT -> IO ()
readVarCurrency :: VARIANT
                -> IO (Int32, Int32)
readVarCurrency p =
  do
    hi <- allocBytes (fromIntegral sizeofInt32)
    lo <- allocBytes (fromIntegral sizeofInt32)
    o_readVarCurrency <- prim_AutoPrim_readVarCurrency p hi lo
    checkHR o_readVarCurrency
    hi <- doThenFree free readInt32 hi
    lo <- doThenFree free readInt32 lo
    return (hi, lo)

foreign import ccall "readVarCurrency" prim_AutoPrim_readVarCurrency :: VARIANT -> Ptr Int32 -> Ptr Int32 -> IO Int32
writeVarWord64 :: Word32
               -> Word32
               -> VARIANT
               -> IO ()
writeVarWord64 hi lo p =
  prim_AutoPrim_writeVarWord64 hi
                               lo
                               p

foreign import ccall "writeVarWord64" prim_AutoPrim_writeVarWord64 :: Word32 -> Word32 -> VARIANT -> IO ()
readVarWord64 :: VARIANT
              -> IO (Word32, Word32)
readVarWord64 p =
  do
    hi <- allocBytes (fromIntegral sizeofWord32)
    lo <- allocBytes (fromIntegral sizeofWord32)
    o_readVarWord64 <- prim_AutoPrim_readVarWord64 p hi lo
    checkHR o_readVarWord64
    hi <- doThenFree free readWord32 hi
    lo <- doThenFree free readWord32 lo
    return (hi, lo)

foreign import ccall "readVarWord64" prim_AutoPrim_readVarWord64 :: VARIANT -> Ptr Word32 -> Ptr Word32 -> IO Int32
writeVarVariant :: VARIANT
                -> VARIANT
                -> IO ()
writeVarVariant p1 p2 =
  prim_AutoPrim_writeVarVariant p1
                                p2

foreign import ccall "writeVarVariant" prim_AutoPrim_writeVarVariant :: VARIANT -> VARIANT -> IO ()
readVarVariant :: VARIANT
               -> IO (Ptr VARIANT)
readVarVariant p1 =
  do
    p2 <- allocBytes (fromIntegral sizeofVARIANT)
    o_readVarVariant <- prim_AutoPrim_readVarVariant p1 p2
    checkHR o_readVarVariant
    return (p2)

foreign import ccall "readVarVariant" prim_AutoPrim_readVarVariant :: VARIANT -> Ptr VARIANT -> IO Int32
writeVarSAFEARRAY :: VARIANT
                  -> SAFEARRAY
                  -> Int32
                  -> IO ()
writeVarSAFEARRAY p1 p2 vt =
  do
    p2 <- marshallSAFEARRAY p2
    withForeignPtr p2 (\ p2 -> prim_AutoPrim_writeVarSAFEARRAY p1 p2 vt)

foreign import ccall "writeVarSAFEARRAY" prim_AutoPrim_writeVarSAFEARRAY :: VARIANT -> Ptr SAFEARRAY -> Int32 -> IO ()
readVarSAFEARRAY :: VARIANT
                 -> Int32
                 -> IO (Ptr ())
readVarSAFEARRAY p1 vt =
  do
    p2 <- allocBytes (fromIntegral sizeofPtr)
    o_readVarSAFEARRAY <- prim_AutoPrim_readVarSAFEARRAY p1 p2 vt
    checkHR o_readVarSAFEARRAY
    return (p2)

foreign import ccall "readVarSAFEARRAY" prim_AutoPrim_readVarSAFEARRAY :: VARIANT -> Ptr () -> Int32 -> IO Int32
primCopyVARIANT :: VARIANT
                -> VARIANT
                -> IO ()
primCopyVARIANT p1 p2 =
  do
    o_primCopyVARIANT <- prim_AutoPrim_primCopyVARIANT p1 p2
    checkHR o_primCopyVARIANT

foreign import ccall "primCopyVARIANT" prim_AutoPrim_primCopyVARIANT :: VARIANT -> VARIANT -> IO Int32
primVARIANTClear :: VARIANT
                 -> IO ()
primVARIANTClear p1 =
  do
    o_primVARIANTClear <- prim_AutoPrim_primVARIANTClear p1
    checkHR o_primVARIANTClear

foreign import ccall "primVARIANTClear" prim_AutoPrim_primVARIANTClear :: VARIANT -> IO Int32
primClockToDate :: Int32
                -> IO Double
primClockToDate ct =
  do
    pT <- allocBytes (fromIntegral sizeofDouble)
    o_primClockToDate <- prim_AutoPrim_primClockToDate ct pT
    checkHR o_primClockToDate
    doThenFree free readDouble pT

foreign import ccall "primClockToDate" prim_AutoPrim_primClockToDate :: Int32 -> Ptr Double -> IO Int32

