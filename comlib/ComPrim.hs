{-# OPTIONS -#include "comPrim.h" #-}
-- Automatically generated by HaskellDirect (ihc.exe), version 0.20
-- Created: 20:11 Pacific Standard Time, Tuesday 16 December, 2003
-- Command line: -fno-qualified-names -fno-imports -fno-export-lists -fout-pointers-are-not-refs -c ComPrim.idl -o ComPrim.hs

module ComPrim where



import Pointer ( makeFO, finalNoFree )
import HDirect
import Foreign.ForeignPtr
import Foreign.Ptr
{- BEGIN_GHC_ONLY
import Dynamic
import GHC.IOBase
--import ForeignObj
   END_GHC_ONLY -}
import Int
import Word       ( Word32
                   )
import IOExts     ( unsafePerformIO )
import WideString ( WideString, marshallWideString, freeWideString,
		    readWideString, writeWideString )
import IO         ( hPutStrLn, stderr )

data IUnknown_ a  = Unknown  (ForeignPtr ())
type IUnknown  a  = IUnknown_ a

type HRESULT = Int32

failed    :: HRESULT -> Bool
failed hr = hr < 0

ifaceToAddr :: IUnknown a -> Ptr b
ifaceToAddr (Unknown x)    = castPtr (foreignPtrToPtr x)

addrToIPointer :: Bool -> Ptr b -> IO (IUnknown a)
addrToIPointer finaliseMe x = do
  i <- makeFO x (castPtrToFunPtr $ if finaliseMe then addrOfReleaseIUnknown else finalNoFree)
  return (Unknown i)

marshallIUnknown :: IUnknown a -> IO (ForeignPtr b)
marshallIUnknown (Unknown x) = return (castForeignPtr x)

checkHR :: HRESULT -> IO ()
checkHR hr
      | failed hr   = coFailHR hr
      | otherwise   = return ()

coFailHR :: HRESULT -> IO a
coFailHR  hr         = do
    str <- stringFromHR hr
    coFailWithHR hr str

{- BEGIN_GHC_ONLY
-- ghc-specific
newtype ComError = ComError Int32

comErrorTc = mkTyCon "ComError"

instance Typeable ComError where
   typeOf _ = mkAppTy comErrorTc []

coFailWithHR :: HRESULT -> String -> IO a
coFailWithHR hr msg = 
  ioException (IOError Nothing (DynIOError (toDyn (ComError hr))) "" msg Nothing)
   END_GHC_ONLY -}

{- BEGIN_NOT_FOR_GHC -}
coPrefix   = "Com error: "

coFailWithHR :: HRESULT -> String -> IO a
coFailWithHR hr msg = ioError (userError (coPrefix ++ msg ++ showParen True (shows hr) ""))
{- END_NOT_FOR_GHC   -}

stringFromHR :: HRESULT -> IO String
stringFromHR hr = do
  pstr <- hresultString hr  -- static memory
  unmarshallString (castPtr pstr)


comInitialize :: IO ()
comInitialize =
  do
    o_comInitialize <- prim_ComPrim_comInitialize
    checkHR o_comInitialize

foreign import stdcall "comInitialize" prim_ComPrim_comInitialize :: IO Int32
comUnInitialize :: IO ()
comUnInitialize =
  prim_ComPrim_comUnInitialize

foreign import stdcall "comUnInitialize" prim_ComPrim_comUnInitialize :: IO ()
messageBox :: Ptr Char
           -> Ptr Char
           -> Word32
           -> IO ()
messageBox str title flg =
  prim_ComPrim_messageBox str
                          title
                          flg

foreign import ccall "messageBox" prim_ComPrim_messageBox :: Ptr Char -> Ptr Char -> Word32 -> IO ()
type PIID = Ptr ()
type PCLSID = Ptr ()
type PGUID = Ptr ()
primCLSIDFromProgID :: Ptr Char
                    -> PCLSID
                    -> IO ()
primCLSIDFromProgID str rptr =
  do
    o_primCLSIDFromProgID <- prim_ComPrim_primCLSIDFromProgID str rptr
    checkHR o_primCLSIDFromProgID

foreign import stdcall "primCLSIDFromProgID" prim_ComPrim_primCLSIDFromProgID :: Ptr Char -> Ptr () -> IO Int32
primProgIDFromCLSID :: ForeignPtr ()
                    -> IO (Ptr ())
primProgIDFromCLSID pclsid =
  do
    pwide <- allocBytes (fromIntegral sizeofPtr)
    o_primProgIDFromCLSID <- withForeignPtr pclsid (\ pclsid -> prim_ComPrim_primProgIDFromCLSID pclsid pwide)
    checkHR o_primProgIDFromCLSID
    doThenFree free readPtr pwide

foreign import ccall "primProgIDFromCLSID" prim_ComPrim_primProgIDFromCLSID :: Ptr () -> Ptr (Ptr ()) -> IO Int32
primStringToGUID :: Ptr Wchar_t
                 -> Ptr ()
                 -> IO ()
primStringToGUID str pguid =
  do
    o_primStringToGUID <- prim_ComPrim_primStringToGUID str pguid
    checkHR o_primStringToGUID

foreign import ccall "primStringToGUID" prim_ComPrim_primStringToGUID :: Ptr Word16 -> Ptr () -> IO Int32
primGUIDToString :: ForeignPtr ()
                 -> IO (Ptr ())
primGUIDToString guid =
  do
    str <- allocBytes (fromIntegral sizeofPtr)
    o_primGUIDToString <- withForeignPtr guid (\ guid -> prim_ComPrim_primGUIDToString guid str)
    checkHR o_primGUIDToString
    doThenFree free readPtr str

foreign import ccall "primGUIDToString" prim_ComPrim_primGUIDToString :: Ptr () -> Ptr (Ptr ()) -> IO Int32
primCopyGUID :: ForeignPtr ()
             -> PGUID
             -> IO ()
primCopyGUID pguid1 pguid2 =
  do
    o_primCopyGUID <- withForeignPtr pguid1 (\ pguid1 -> prim_ComPrim_primCopyGUID pguid1 pguid2)
    checkHR o_primCopyGUID

foreign import ccall "primCopyGUID" prim_ComPrim_primCopyGUID :: Ptr () -> Ptr () -> IO Int32
primNewGUID :: ForeignPtr ()
            -> IO ()
primNewGUID pguid =
  do
    o_primNewGUID <- withForeignPtr pguid (\ pguid -> prim_ComPrim_primNewGUID pguid)
    checkHR o_primNewGUID

foreign import ccall "primNewGUID" prim_ComPrim_primNewGUID :: Ptr () -> IO Int32
bindObject :: Ptr Wchar_t
           -> ForeignPtr ()
           -> IO (Ptr (Ptr ()))
bindObject name iid =
  do
    ppv <- allocBytes (fromIntegral sizeofPtr)
    o_bindObject <- withForeignPtr iid (\ iid -> prim_ComPrim_bindObject name iid ppv)
    checkHR o_bindObject
    return (ppv)

foreign import ccall "bindObject" prim_ComPrim_bindObject :: Ptr Word16 -> Ptr () -> Ptr (Ptr ()) -> IO Int32
primComEqual :: IUnknown a0
             -> IUnknown a1
             -> IO Bool
primComEqual unk1 unk2 =
  do
    unk1 <- marshallIUnknown unk1
    unk2 <- marshallIUnknown unk2
    o_primComEqual <- withForeignPtr unk1 (\ unk1 -> withForeignPtr unk2 (\ unk2 -> prim_ComPrim_primComEqual unk1 unk2))
    unmarshallBool o_primComEqual

foreign import ccall "primComEqual" prim_ComPrim_primComEqual :: Ptr (IUnknown a) -> Ptr (IUnknown a) -> IO Int32
isEqualGUID :: ForeignPtr ()
            -> ForeignPtr ()
            -> Bool
isEqualGUID guid1 guid2 =
  unsafePerformIO (withForeignPtr guid1 (\ guid1 -> withForeignPtr guid2 (\ guid2 -> prim_ComPrim_isEqualGUID guid1 guid2)) >>= \ o_isEqualGUID ->
                   unmarshallBool o_isEqualGUID)

foreign import stdcall "IsEqualGUID" prim_ComPrim_isEqualGUID :: Ptr () -> Ptr () -> IO Int32
lOCALE_USER_DEFAULT :: Word32
lOCALE_USER_DEFAULT =
  unsafePerformIO (prim_ComPrim_lOCALE_USER_DEFAULT)

foreign import ccall "lOCALE_USER_DEFAULT" prim_ComPrim_lOCALE_USER_DEFAULT :: IO Word32
primCreateTypeLib :: Int32
                  -> WideString
                  -> IO (Ptr (Ptr ()))
primCreateTypeLib skind lpkind =
  do
    ppv <- allocBytes (fromIntegral sizeofPtr)
    lpkind <- marshallWideString lpkind
    o_primCreateTypeLib <- prim_ComPrim_primCreateTypeLib skind lpkind ppv
    freeWideString lpkind
    checkHR o_primCreateTypeLib
    return (ppv)

foreign import ccall "primCreateTypeLib" prim_ComPrim_primCreateTypeLib :: Int32 -> Ptr WideString -> Ptr (Ptr ()) -> IO Int32
getLastError :: IO Word32
getLastError = prim_ComPrim_getLastError

foreign import stdcall "GetLastError" prim_ComPrim_getLastError :: IO Word32
hresultString :: Int32
              -> IO (Ptr ())
hresultString i = prim_ComPrim_hresultString i

foreign import ccall "hresultString" prim_ComPrim_hresultString :: Int32 -> IO (Ptr ())
coCreateInstance :: ForeignPtr ()
                 -> ForeignPtr ()
                 -> Int32
                 -> ForeignPtr ()
                 -> Ptr ()
                 -> IO ()
coCreateInstance clsid inner ctxt riid ppv =
  do
    o_coCreateInstance <- withForeignPtr clsid (\ clsid -> withForeignPtr inner (\ inner -> withForeignPtr riid (\ riid -> prim_ComPrim_coCreateInstance clsid inner ctxt riid ppv)))
    checkHR o_coCreateInstance

foreign import stdcall "CoCreateInstance" prim_ComPrim_coCreateInstance :: Ptr () -> Ptr () -> Int32 -> Ptr () -> Ptr () -> IO Int32
type ULONG = Word32
type DWORD = Word32
data COAUTHIDENTITY = COAUTHIDENTITY {user :: String,
                                      domain :: String,
                                      password :: String,
                                      flags :: ULONG}
                        
writeCOAUTHIDENTITY :: Ptr COAUTHIDENTITY
                    -> COAUTHIDENTITY
                    -> IO ()
writeCOAUTHIDENTITY ptr (COAUTHIDENTITY user domain password flags) =
  let
   userLength = (fromIntegral (length user) :: Word32)
  in
  do
    user <- marshallString user
    let domainLength = (fromIntegral (length domain) :: Word32)
    domain <- marshallString domain
    let passwordLength = (fromIntegral (length password) :: Word32)
    password <- marshallString password
    let pf0 = ptr
        pf1 = addNCastPtr pf0 0
    writePtr pf1 user
    let pf2 = addNCastPtr pf1 4
    writeWord32 pf2 userLength
    let pf3 = addNCastPtr pf2 4
    writePtr pf3 domain
    let pf4 = addNCastPtr pf3 4
    writeWord32 pf4 domainLength
    let pf5 = addNCastPtr pf4 4
    writePtr pf5 password
    let pf6 = addNCastPtr pf5 4
    writeWord32 pf6 passwordLength
    let pf7 = addNCastPtr pf6 4
    writeWord32 pf7 flags

readCOAUTHIDENTITY :: Ptr COAUTHIDENTITY
                   -> IO COAUTHIDENTITY
readCOAUTHIDENTITY ptr =
  let
   pf0 = ptr
   pf1 = addNCastPtr pf0 0
  in
  do
    user <- readPtr pf1
    let pf2 = addNCastPtr pf1 4
    userLength <- readWord32 pf2
    let pf3 = addNCastPtr pf2 4
    domain <- readPtr pf3
    let pf4 = addNCastPtr pf3 4
    domainLength <- readWord32 pf4
    let pf5 = addNCastPtr pf4 4
    password <- readPtr pf5
    let pf6 = addNCastPtr pf5 4
    passwordLength <- readWord32 pf6
    let pf7 = addNCastPtr pf6 4
    flags <- readWord32 pf7
    userLength <- unmarshallWord32 userLength
    domainLength <- unmarshallWord32 domainLength
    passwordLength <- unmarshallWord32 passwordLength
    user <- unmarshallString user
    domain <- unmarshallString domain
    password <- unmarshallString password
    return (COAUTHIDENTITY user domain password flags)

sizeofCOAUTHIDENTITY :: Word32
sizeofCOAUTHIDENTITY = 28

data COAUTHINFO = COAUTHINFO {dwAuthnSvc :: DWORD,
                              dwAuthzSvc :: DWORD,
                              pwszServerPrincName :: WideString,
                              dwAuthnLevel :: DWORD,
                              dwImpersonationLevel :: DWORD,
                              pAuthIdentityData :: (Maybe COAUTHIDENTITY),
                              dwCapabilities :: DWORD}
                    
writeCOAUTHINFO :: Ptr COAUTHINFO
                -> COAUTHINFO
                -> IO ()
writeCOAUTHINFO ptr (COAUTHINFO dwAuthnSvc dwAuthzSvc pwszServerPrincName dwAuthnLevel dwImpersonationLevel pAuthIdentityData dwCapabilities) =
  let
   pf0 = ptr
   pf1 = addNCastPtr pf0 0
  in
  do
    writeWord32 pf1 dwAuthnSvc
    let pf2 = addNCastPtr pf1 4
    writeWord32 pf2 dwAuthzSvc
    let pf3 = addNCastPtr pf2 4
    writeWideString pf3 pwszServerPrincName
    let pf4 = addNCastPtr pf3 4
    writeWord32 pf4 dwAuthnLevel
    let pf5 = addNCastPtr pf4 4
    writeWord32 pf5 dwImpersonationLevel
    let pf6 = addNCastPtr pf5 4
    writeunique (allocBytes (fromIntegral sizeofCOAUTHIDENTITY)) writeCOAUTHIDENTITY pf6 pAuthIdentityData
    let pf7 = addNCastPtr pf6 4
    writeWord32 pf7 dwCapabilities

readCOAUTHINFO :: Ptr COAUTHINFO
               -> IO COAUTHINFO
readCOAUTHINFO ptr =
  let
   pf0 = ptr
   pf1 = addNCastPtr pf0 0
  in
  do
    dwAuthnSvc <- readWord32 pf1
    let pf2 = addNCastPtr pf1 4
    dwAuthzSvc <- readWord32 pf2
    let pf3 = addNCastPtr pf2 4
    pwszServerPrincName <- readWideString pf3
    let pf4 = addNCastPtr pf3 4
    dwAuthnLevel <- readWord32 pf4
    let pf5 = addNCastPtr pf4 4
    dwImpersonationLevel <- readWord32 pf5
    let pf6 = addNCastPtr pf5 4
    pAuthIdentityData <- readunique readCOAUTHIDENTITY pf6
    let pf7 = addNCastPtr pf6 4
    dwCapabilities <- readWord32 pf7
    return (COAUTHINFO dwAuthnSvc dwAuthzSvc pwszServerPrincName dwAuthnLevel dwImpersonationLevel pAuthIdentityData dwCapabilities)

sizeofCOAUTHINFO :: Word32
sizeofCOAUTHINFO = 28

data COSERVERINFO = COSERVERINFO {dwReserved1 :: DWORD,
                                  pwszName :: WideString,
                                  pAuthInfo :: (Maybe COAUTHINFO),
                                  dwReserved2 :: DWORD}
                      
writeCOSERVERINFO :: Ptr COSERVERINFO
                  -> COSERVERINFO
                  -> IO ()
writeCOSERVERINFO ptr (COSERVERINFO dwReserved1 pwszName pAuthInfo dwReserved2) =
  let
   pf0 = ptr
   pf1 = addNCastPtr pf0 0
  in
  do
    writeWord32 pf1 dwReserved1
    let pf2 = addNCastPtr pf1 4
    writeWideString pf2 pwszName
    let pf3 = addNCastPtr pf2 4
    writeunique (allocBytes (fromIntegral sizeofCOAUTHINFO)) writeCOAUTHINFO pf3 pAuthInfo
    let pf4 = addNCastPtr pf3 4
    writeWord32 pf4 dwReserved2

readCOSERVERINFO :: Ptr COSERVERINFO
                 -> IO COSERVERINFO
readCOSERVERINFO ptr =
  let
   pf0 = ptr
   pf1 = addNCastPtr pf0 0
  in
  do
    dwReserved1 <- readWord32 pf1
    let pf2 = addNCastPtr pf1 4
    pwszName <- readWideString pf2
    let pf3 = addNCastPtr pf2 4
    pAuthInfo <- readunique readCOAUTHINFO pf3
    let pf4 = addNCastPtr pf3 4
    dwReserved2 <- readWord32 pf4
    return (COSERVERINFO dwReserved1 pwszName pAuthInfo dwReserved2)

sizeofCOSERVERINFO :: Word32
sizeofCOSERVERINFO = 16

data MULTI_QI_PRIM = MULTI_QI {pIID :: PGUID,
                               pItf :: (Ptr ()),
                               hr :: HRESULT}
                       
writeMULTI_QI_PRIM :: Ptr MULTI_QI_PRIM
                   -> MULTI_QI_PRIM
                   -> IO ()
writeMULTI_QI_PRIM ptr (MULTI_QI pIID pItf hr) =
  let
   pf0 = ptr
   pf1 = addNCastPtr pf0 0
  in
  do
    writePtr pf1 pIID
    let pf2 = addNCastPtr pf1 4
    writePtr pf2 pItf
    let pf3 = addNCastPtr pf2 4
    writeInt32 pf3 hr

readMULTI_QI_PRIM :: Ptr MULTI_QI_PRIM
                  -> IO MULTI_QI_PRIM
readMULTI_QI_PRIM ptr =
  let
   pf0 = ptr
   pf1 = addNCastPtr pf0 0
  in
  do
    pIID <- readPtr pf1
    let pf2 = addNCastPtr pf1 4
    pItf <- readPtr pf2
    let pf3 = addNCastPtr pf2 4
    hr <- readInt32 pf3
    return (MULTI_QI pIID pItf hr)

sizeofMULTI_QI_PRIM :: Word32
sizeofMULTI_QI_PRIM = 12

coCreateInstanceEx :: ForeignPtr ()
                   -> ForeignPtr ()
                   -> DWORD
                   -> Maybe COSERVERINFO
                   -> [MULTI_QI_PRIM]
                   -> IO [MULTI_QI_PRIM]
coCreateInstanceEx clsid pUnkOuter dwClsCtx pServerInfo pResults =
  let
   cmq = (fromIntegral (length pResults) :: Word32)
  in
  do
    pResults <- marshalllist sizeofMULTI_QI_PRIM writeMULTI_QI_PRIM pResults
    pServerInfo <- marshallunique (allocBytes (fromIntegral sizeofCOSERVERINFO)) writeCOSERVERINFO pServerInfo
    o_coCreateInstanceEx <- withForeignPtr clsid (\ clsid -> withForeignPtr pUnkOuter (\ pUnkOuter -> prim_ComPrim_coCreateInstanceEx clsid pUnkOuter dwClsCtx pServerInfo cmq pResults))
    free pServerInfo
    checkHR o_coCreateInstanceEx
    cmq <- unmarshallWord32 cmq
    unmarshalllist sizeofMULTI_QI_PRIM 0 cmq readMULTI_QI_PRIM pResults

foreign import stdcall "CoCreateInstanceEx" prim_ComPrim_coCreateInstanceEx :: Ptr () -> Ptr () -> Word32 -> Ptr COSERVERINFO -> Word32 -> Ptr MULTI_QI_PRIM -> IO Int32
getActiveObject :: ForeignPtr ()
                -> Ptr ()
                -> Ptr ()
                -> IO ()
getActiveObject clsid inner ppv =
  do
    o_getActiveObject <- withForeignPtr clsid (\ clsid -> prim_ComPrim_getActiveObject clsid inner ppv)
    checkHR o_getActiveObject

foreign import stdcall "GetActiveObject" prim_ComPrim_getActiveObject :: Ptr () -> Ptr () -> Ptr () -> IO Int32
primQI :: Ptr ()
       -> Ptr ()
       -> ForeignPtr ()
       -> Ptr (Ptr ())
       -> IO ()
primQI methPtr iptr riid ppv =
  do
    o_primQI <- withForeignPtr riid (\ riid -> prim_ComPrim_primQI methPtr iptr riid ppv)
    checkHR o_primQI

foreign import ccall "primQI" prim_ComPrim_primQI :: Ptr () -> Ptr () -> Ptr () -> Ptr (Ptr ()) -> IO Int32
primAddRef :: Ptr ()
           -> Ptr ()
           -> IO Word32
primAddRef methPtr iptr =
  prim_ComPrim_primAddRef methPtr
                          iptr

foreign import ccall "primAddRef" prim_ComPrim_primAddRef :: Ptr () -> Ptr () -> IO Word32
primRelease :: Ptr ()
            -> Ptr ()
            -> IO Word32
primRelease methPtr iptr =
  prim_ComPrim_primRelease methPtr
                           iptr

foreign import ccall "primRelease" prim_ComPrim_primRelease :: Ptr () -> Ptr () -> IO Word32
primEnumNext :: Ptr ()
             -> Ptr ()
             -> Word32
             -> Ptr ()
             -> Ptr ()
             -> IO ()
primEnumNext methPtr iptr celt ptr po =
  do
    o_primEnumNext <- prim_ComPrim_primEnumNext methPtr iptr celt ptr po
    checkHR o_primEnumNext

foreign import ccall "primEnumNext" prim_ComPrim_primEnumNext :: Ptr () -> Ptr () -> Word32 -> Ptr () -> Ptr () -> IO Int32
primEnumSkip :: Ptr ()
             -> Ptr ()
             -> Word32
             -> IO ()
primEnumSkip methPtr iptr celt =
  do
    o_primEnumSkip <- prim_ComPrim_primEnumSkip methPtr iptr celt
    checkHR o_primEnumSkip

foreign import ccall "primEnumSkip" prim_ComPrim_primEnumSkip :: Ptr () -> Ptr () -> Word32 -> IO Int32
primEnumReset :: Ptr ()
              -> Ptr ()
              -> IO ()
primEnumReset methPtr iptr =
  do
    o_primEnumReset <- prim_ComPrim_primEnumReset methPtr iptr
    checkHR o_primEnumReset

foreign import ccall "primEnumReset" prim_ComPrim_primEnumReset :: Ptr () -> Ptr () -> IO Int32
primEnumClone :: Ptr ()
              -> Ptr ()
              -> Ptr ()
              -> IO ()
primEnumClone methPtr iptr ppv =
  do
    o_primEnumClone <- prim_ComPrim_primEnumClone methPtr iptr ppv
    checkHR o_primEnumClone

foreign import ccall "primEnumClone" prim_ComPrim_primEnumClone :: Ptr () -> Ptr () -> Ptr () -> IO Int32
primPersistLoad :: Ptr ()
                -> Ptr ()
                -> Ptr Wchar_t
                -> Word32
                -> IO ()
primPersistLoad methPtr iptr pszFileName dwMode =
  do
    o_primPersistLoad <- prim_ComPrim_primPersistLoad methPtr iptr pszFileName dwMode
    checkHR o_primPersistLoad

foreign import stdcall "primPersistLoad" prim_ComPrim_primPersistLoad :: Ptr () -> Ptr () -> Ptr Word16 -> Word32 -> IO Int32
primNullIID :: IO (Ptr ())
primNullIID = prim_ComPrim_primNullIID

foreign import ccall "primNullIID" prim_ComPrim_primNullIID :: IO (Ptr ())
loadTypeLib :: Ptr Wchar_t
            -> Ptr ()
            -> IO ()
loadTypeLib pfname ptr =
  do
    o_loadTypeLib <- prim_ComPrim_loadTypeLib pfname ptr
    checkHR o_loadTypeLib

foreign import stdcall "LoadTypeLib" prim_ComPrim_loadTypeLib :: Ptr Word16 -> Ptr () -> IO Int32
loadTypeLibEx :: Ptr Wchar_t
              -> Int32
              -> Ptr ()
              -> IO ()
loadTypeLibEx pfname rkind ptr =
  do
    o_loadTypeLibEx <- prim_ComPrim_loadTypeLibEx pfname rkind ptr
    checkHR o_loadTypeLibEx

foreign import stdcall "LoadTypeLibEx" prim_ComPrim_loadTypeLibEx :: Ptr Word16 -> Int32 -> Ptr () -> IO Int32
loadRegTypeLib :: ForeignPtr ()
               -> Int32
               -> Int32
               -> Int32
               -> Ptr ()
               -> IO ()
loadRegTypeLib pguid maj min lcid ptr =
  do
    o_loadRegTypeLib <- withForeignPtr pguid (\ pguid -> prim_ComPrim_loadRegTypeLib pguid maj min lcid ptr)
    checkHR o_loadRegTypeLib

foreign import stdcall "LoadRegTypeLib" prim_ComPrim_loadRegTypeLib :: Ptr () -> Int32 -> Int32 -> Int32 -> Ptr () -> IO Int32
primQueryPathOfRegTypeLib :: ForeignPtr ()
                          -> Word16
                          -> Word16
                          -> IO (Ptr Wchar_t)
primQueryPathOfRegTypeLib pgd maj min =
  withForeignPtr pgd
                 (\ pgd -> prim_ComPrim_primQueryPathOfRegTypeLib pgd maj min)

foreign import ccall "primQueryPathOfRegTypeLib" prim_ComPrim_primQueryPathOfRegTypeLib :: Ptr () -> Word16 -> Word16 -> IO (Ptr Word16)
addrOfReleaseIUnknown :: Ptr ()
addrOfReleaseIUnknown =
  unsafePerformIO (prim_ComPrim_addrOfReleaseIUnknown)

foreign import stdcall "addrOfReleaseIUnknown" prim_ComPrim_addrOfReleaseIUnknown :: IO (Ptr ())
bstrToStringLen :: Ptr String
                -> Int32
                -> Ptr Char
                -> IO ()
bstrToStringLen bstr len str =
  do
    o_bstrToStringLen <- prim_ComPrim_bstrToStringLen bstr len str
    checkHR o_bstrToStringLen

foreign import ccall "bstrToStringLen" prim_ComPrim_bstrToStringLen :: Ptr String -> Int32 -> Ptr Char -> IO Int32
bstrLen :: Ptr String
        -> Int32
bstrLen bstr = unsafePerformIO (prim_ComPrim_bstrLen bstr)

foreign import ccall "bstrLen" prim_ComPrim_bstrLen :: Ptr String -> IO Int32
stringToBSTR :: Ptr String
             -> IO (Ptr String)
stringToBSTR bstr =
  do
    res <- allocBytes (fromIntegral sizeofPtr)
    o_stringToBSTR <- prim_ComPrim_stringToBSTR bstr res
    checkHR o_stringToBSTR
    return (res)

foreign import ccall "stringToBSTR" prim_ComPrim_stringToBSTR :: Ptr String -> Ptr String -> IO Int32
getModuleFileName :: Ptr ()
                  -> IO String
getModuleFileName hModule =
  do
    o_getModuleFileName <- prim_ComPrim_getModuleFileName hModule
    doThenFree freeString unmarshallString o_getModuleFileName

foreign import ccall "getModuleFileName" prim_ComPrim_getModuleFileName :: Ptr () -> IO (Ptr String)
messagePump :: IO ()
messagePump =
  prim_ComPrim_messagePump

foreign import ccall "messagePump" prim_ComPrim_messagePump :: IO ()
postQuitMsg :: IO ()
postQuitMsg =
  prim_ComPrim_postQuitMsg

foreign import ccall "postQuitMsg" prim_ComPrim_postQuitMsg :: IO ()
primOutputDebugString :: String
                      -> IO ()
primOutputDebugString msg =
  do
    msg <- marshallString msg
    prim_ComPrim_primOutputDebugString msg
    freeString msg

foreign import stdcall "OutputDebugString" prim_ComPrim_primOutputDebugString :: Ptr String -> IO ()
primGetVersionInfo :: IO (Word32, Word32, Word32)
primGetVersionInfo =
  do
    maj <- allocBytes (fromIntegral sizeofWord32)
    min <- allocBytes (fromIntegral sizeofWord32)
    pid <- allocBytes (fromIntegral sizeofWord32)
    prim_ComPrim_primGetVersionInfo maj min pid
    maj <- doThenFree free readWord32 maj
    min <- doThenFree free readWord32 min
    pid <- doThenFree free readWord32 pid
    return (maj, min, pid)

foreign import stdcall "primGetVersionInfo" prim_ComPrim_primGetVersionInfo :: Ptr Word32 -> Ptr Word32 -> Ptr Word32 -> IO ()
coRegisterClassObject :: ForeignPtr ()
                      -> ForeignPtr ()
                      -> Int32
                      -> Int32
                      -> IO Word32
coRegisterClassObject rclsid pUnk dwClsContext flags0 =
  do
    lpwRegister <- allocBytes (fromIntegral sizeofWord32)
    o_coRegisterClassObject <- withForeignPtr rclsid (\ rclsid -> withForeignPtr pUnk (\ pUnk -> prim_ComPrim_coRegisterClassObject rclsid pUnk dwClsContext flags0 lpwRegister))
    checkHR o_coRegisterClassObject
    doThenFree free readWord32 lpwRegister

foreign import stdcall "CoRegisterClassObject" prim_ComPrim_coRegisterClassObject :: Ptr () -> Ptr () -> Int32 -> Int32 -> Ptr Word32 -> IO Int32

