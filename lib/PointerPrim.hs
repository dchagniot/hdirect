{-# OPTIONS -#include "PointerSrc.h" #-}
{-# LANGUAGE ForeignFunctionInterface #-}
-- Automatically generated by HaskellDirect (ihc.exe), version 0.20
-- Created: 16:37 Pacific Standard Time, Thursday 18 December, 2003
-- Command line: -fno-qualified-names -fkeep-hresult -fout-pointers-are-not-refs -c PointerPrim.idl -o PointerPrim.hs

module PointerPrim
       ( primNoFree
       , primFreeBSTR
       , primFreeMemory
       , finalNoFree
       , finalFreeMemory
       , primAllocMemory
       , primFinalise
       ) where
       
import Prelude
import Foreign.Ptr (Ptr)
import System.IO.Unsafe (unsafePerformIO)
import Word (Word32)

primNoFree :: Ptr ()
           -> IO ()
primNoFree p =
  prim_PointerPrim_primNoFree p

foreign import ccall "primNoFree" prim_PointerPrim_primNoFree :: Ptr () -> IO ()
primFreeBSTR :: Ptr ()
             -> IO ()
primFreeBSTR p =
  prim_PointerPrim_primFreeBSTR p

foreign import ccall "primFreeBSTR" prim_PointerPrim_primFreeBSTR :: Ptr () -> IO ()
primFreeMemory :: Ptr ()
               -> IO ()
primFreeMemory p =
  prim_PointerPrim_primFreeMemory p

foreign import ccall "primFreeMemory" prim_PointerPrim_primFreeMemory :: Ptr () -> IO ()
finalNoFree :: Ptr ()
finalNoFree = unsafePerformIO (prim_PointerPrim_finalNoFree)

foreign import ccall "finalNoFree" prim_PointerPrim_finalNoFree :: IO (Ptr ())
finalFreeMemory :: Ptr ()
finalFreeMemory =
  unsafePerformIO (prim_PointerPrim_finalFreeMemory)

foreign import ccall "finalFreeMemory" prim_PointerPrim_finalFreeMemory :: IO (Ptr ())
primAllocMemory :: Word32
                -> IO (Ptr ())
primAllocMemory sz = prim_PointerPrim_primAllocMemory sz

foreign import ccall "primAllocMemory" prim_PointerPrim_primAllocMemory :: Word32 -> IO (Ptr ())
primFinalise :: Ptr ()
             -> Ptr ()
             -> IO ()
primFinalise finaliser finalisee =
  prim_PointerPrim_primFinalise finaliser
                                finalisee

foreign import ccall "primFinalise" prim_PointerPrim_primFinalise :: Ptr () -> Ptr () -> IO ()

