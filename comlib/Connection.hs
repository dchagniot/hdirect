-- Automatically generated by HaskellDirect (ihc.exe), version 0.20
-- Created: 20:13 Pacific Standard Time, Tuesday 16 December, 2003
-- Command line: -fno-qualified-names -fappend-interface-short-name -c Connection.idl -o Connection.hs

module Connection
       ( DWORD
       , ULONG
       , PCONNECTIONPOINT
       , LPCONNECTIONPOINT
       , getConnectionInterface
       , getConnectionPointContainer
       , advise
       , unadvise
       , enumConnections
       , IConnectionPoint
       , IConnectionPoint_
       , iidIConnectionPoint
       , PCONNECTIONPOINTCONTAINER
       , LPCONNECTIONPOINTCONTAINER
       , enumConnectionPoints
       , findConnectionPoint
       , IConnectionPointContainer
       , IConnectionPointContainer_
       , iidIConnectionPointContainer
       , PENUMCONNECTIONS
       , LPENUMCONNECTIONS
       , CONNECTDATA(..)
       , writeCONNECTDATA
       , readCONNECTDATA
       , sizeofCONNECTDATA
       , TagCONNECTDATA
       , PCONNECTDATA0
       , TagCONNECTDATA0
       , LPCONNECTDATA0
       , next
       , skip
       , reset
       , clone
       , IEnumConnections
       , IEnumConnections_
       , iidIEnumConnections
       , PENUMCONNECTIONPOINTS
       , LPENUMCONNECTIONPOINTS
       , nextECP
       , skipECP
       , resetECP
       , cloneECP
       , IEnumConnectionPoints
       , IEnumConnectionPoints_
       , iidIEnumConnectionPoints
       ) where
       
import Prelude
import Com (IUnknown, IID, mkIID, sizeofIID, invokeAndCheck, 
            unmarshallIID, readIUnknown, marshallIUnknown, marshallIID, 
            writeIUnknown, enumNext, enumSkip, enumReset, enumClone)
import Foreign.ForeignPtr (withForeignPtr)
import Foreign.Ptr (Ptr)
import HDirect (allocBytes, sizeofForeignPtr, free, doThenFree, 
                sizeofWord32, readWord32, writeWord32, addNCastPtr)
import Int (Int32)
import Word (Word32)

type DWORD = Word32
type ULONG = Word32
-- --------------------------------------------------
-- 
-- interface IConnectionPoint
-- 
-- --------------------------------------------------
data IConnectionPoint_ a = IConnectionPoint__
                             
type IConnectionPoint a = IUnknown (IConnectionPoint_ a)
iidIConnectionPoint :: IID (IConnectionPoint ())
iidIConnectionPoint =
  mkIID "{B196B286-BAB4-101A-B69C-00AA00341D07}"

type PCONNECTIONPOINT = IConnectionPoint ()
type LPCONNECTIONPOINT = IConnectionPoint ()
getConnectionInterface :: IConnectionPoint a0
                       -> IO (IID ())
getConnectionInterface iptr =
  do
    piid <- allocBytes (fromIntegral sizeofIID)
    invokeAndCheck (\ methPtr iptr -> prim_Connection_getConnectionInterface methPtr iptr piid) 3 iptr
    unmarshallIID True piid

foreign import stdcall "dynamic" prim_Connection_getConnectionInterface :: Ptr () -> Ptr () -> Ptr (IID a) -> IO Int32
getConnectionPointContainer :: IConnectionPoint a0
                            -> IO (IConnectionPointContainer ())
getConnectionPointContainer iptr =
  do
    ppCPC <- allocBytes (fromIntegral sizeofForeignPtr)
    invokeAndCheck (\ methPtr iptr -> prim_Connection_getConnectionPointContainer methPtr iptr ppCPC) 4 iptr
    doThenFree free (readIUnknown False) ppCPC

foreign import stdcall "dynamic" prim_Connection_getConnectionPointContainer :: Ptr () -> Ptr () -> Ptr (Ptr (IConnectionPointContainer a)) -> IO Int32
advise :: IUnknown a1
       -> IConnectionPoint a0
       -> IO DWORD
advise pUnkSink iptr =
  do
    pdwCookie <- allocBytes (fromIntegral sizeofWord32)
    pUnkSink <- marshallIUnknown pUnkSink
    invokeAndCheck (\ methPtr iptr -> withForeignPtr pUnkSink (\ pUnkSink -> prim_Connection_advise methPtr iptr pUnkSink pdwCookie)) 5 iptr
    doThenFree free readWord32 pdwCookie

foreign import stdcall "dynamic" prim_Connection_advise :: Ptr () -> Ptr () -> Ptr (IUnknown a) -> Ptr Word32 -> IO Int32
unadvise :: DWORD
         -> IConnectionPoint a0
         -> IO ()
unadvise dwCookie iptr =
  invokeAndCheck (\ methPtr iptr -> prim_Connection_unadvise methPtr iptr dwCookie)
                 6
                 iptr

foreign import stdcall "dynamic" prim_Connection_unadvise :: Ptr () -> Ptr () -> Word32 -> IO Int32
enumConnections :: IConnectionPoint a0
                -> IO (IEnumConnections ())
enumConnections iptr =
  do
    ppEnum <- allocBytes (fromIntegral sizeofForeignPtr)
    invokeAndCheck (\ methPtr iptr -> prim_Connection_enumConnections methPtr iptr ppEnum) 7 iptr
    doThenFree free (readIUnknown False) ppEnum

foreign import stdcall "dynamic" prim_Connection_enumConnections :: Ptr () -> Ptr () -> Ptr (Ptr (IEnumConnections a)) -> IO Int32
-- --------------------------------------------------
-- 
-- interface IConnectionPointContainer
-- 
-- --------------------------------------------------
data IConnectionPointContainer_ a = IConnectionPointContainer__
                                      
type IConnectionPointContainer a = IUnknown (IConnectionPointContainer_ a)
iidIConnectionPointContainer :: IID (IConnectionPointContainer ())
iidIConnectionPointContainer =
  mkIID "{B196B284-BAB4-101A-B69C-00AA00341D07}"

type PCONNECTIONPOINTCONTAINER = IConnectionPointContainer ()
type LPCONNECTIONPOINTCONTAINER = IConnectionPointContainer ()
enumConnectionPoints :: IConnectionPointContainer a0
                     -> IO (IEnumConnectionPoints ())
enumConnectionPoints iptr =
  do
    ppEnum <- allocBytes (fromIntegral sizeofForeignPtr)
    invokeAndCheck (\ methPtr iptr -> prim_Connection_enumConnectionPoints methPtr iptr ppEnum) 3 iptr
    doThenFree free (readIUnknown False) ppEnum

foreign import stdcall "dynamic" prim_Connection_enumConnectionPoints :: Ptr () -> Ptr () -> Ptr (Ptr (IEnumConnectionPoints a)) -> IO Int32
findConnectionPoint :: IID a1
                    -> IConnectionPointContainer a0
                    -> IO (IConnectionPoint ())
findConnectionPoint riid iptr =
  do
    ppCP <- allocBytes (fromIntegral sizeofForeignPtr)
    riid <- marshallIID riid
    invokeAndCheck (\ methPtr iptr -> withForeignPtr riid (\ riid -> prim_Connection_findConnectionPoint methPtr iptr riid ppCP)) 4 iptr
    doThenFree free (readIUnknown False) ppCP

foreign import stdcall "dynamic" prim_Connection_findConnectionPoint :: Ptr () -> Ptr () -> Ptr (IID a) -> Ptr (Ptr (IConnectionPoint a)) -> IO Int32
-- --------------------------------------------------
-- 
-- interface IEnumConnections
-- 
-- --------------------------------------------------
data IEnumConnections_ a = IEnumConnections__
                             
type IEnumConnections a = IUnknown (IEnumConnections_ a)
iidIEnumConnections :: IID (IEnumConnections ())
iidIEnumConnections =
  mkIID "{B196B287-BAB4-101A-B69C-00AA00341D07}"

type PENUMCONNECTIONS = IEnumConnections ()
type LPENUMCONNECTIONS = IEnumConnections ()
data CONNECTDATA = TagCONNECTDATA {pUnk :: (IUnknown ()),
                                   dwCookie :: DWORD}
                     
writeCONNECTDATA :: Bool
                 -> Ptr CONNECTDATA
                 -> CONNECTDATA
                 -> IO ()
writeCONNECTDATA addRefMe__ ptr (TagCONNECTDATA pUnk dwCookie) =
  let
   pf0 = ptr
   pf1 = addNCastPtr pf0 0
  in
  do
    writeIUnknown addRefMe__ pf1 pUnk
    let pf2 = addNCastPtr pf1 4
    writeWord32 pf2 dwCookie

readCONNECTDATA :: Bool
                -> Ptr CONNECTDATA
                -> IO CONNECTDATA
readCONNECTDATA finaliseMe__ ptr =
  let
   pf0 = ptr
   pf1 = addNCastPtr pf0 0
  in
  do
    pUnk <- readIUnknown finaliseMe__ pf1
    let pf2 = addNCastPtr pf1 4
    dwCookie <- readWord32 pf2
    return (TagCONNECTDATA pUnk dwCookie)

sizeofCONNECTDATA :: Word32
sizeofCONNECTDATA = 8

type TagCONNECTDATA = CONNECTDATA
type PCONNECTDATA0 = TagCONNECTDATA
type TagCONNECTDATA0 = CONNECTDATA
type LPCONNECTDATA0 = TagCONNECTDATA0
next :: ULONG
     -> IEnumConnections a0
     -> IO [CONNECTDATA]
next cConnections iptr =
  enumNext sizeofCONNECTDATA
           (readCONNECTDATA False)
           cConnections
           iptr

skip :: ULONG
     -> IEnumConnections a0
     -> IO ()
skip cConnections iptr =
  enumSkip cConnections
           iptr

reset :: IEnumConnections a0
      -> IO ()
reset iptr = enumReset iptr

clone :: IEnumConnections a0
      -> IO (IEnumConnections ())
clone iptr = enumClone iptr

-- --------------------------------------------------
-- 
-- interface IEnumConnectionPoints
-- 
-- --------------------------------------------------
data IEnumConnectionPoints_ a = IEnumConnectionPoints__
                                  
type IEnumConnectionPoints a = IUnknown (IEnumConnectionPoints_ a)
iidIEnumConnectionPoints :: IID (IEnumConnectionPoints ())
iidIEnumConnectionPoints =
  mkIID "{B196B285-BAB4-101A-B69C-00AA00341D07}"

type PENUMCONNECTIONPOINTS = IEnumConnectionPoints ()
type LPENUMCONNECTIONPOINTS = IEnumConnectionPoints ()
nextECP :: ULONG
        -> IEnumConnectionPoints a0
        -> IO [IConnectionPoint a1]
nextECP cConnections iptr =
  enumNext sizeofForeignPtr
           (readIUnknown False)
           cConnections
           iptr

skipECP :: ULONG
        -> IEnumConnectionPoints a0
        -> IO ()
skipECP cConnections iptr =
  enumSkip cConnections
           iptr

resetECP :: IEnumConnectionPoints a0
         -> IO ()
resetECP iptr = enumReset iptr

cloneECP :: IEnumConnectionPoints a0
         -> IO (IEnumConnectionPoints ())
cloneECP iptr = enumClone iptr


