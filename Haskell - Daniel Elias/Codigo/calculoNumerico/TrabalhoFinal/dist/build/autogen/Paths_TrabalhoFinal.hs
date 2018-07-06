{-# LANGUAGE CPP #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -fno-warn-implicit-prelude #-}
module Paths_TrabalhoFinal (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,0,1] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/daniel/.cabal/bin"
libdir     = "/home/daniel/.cabal/lib/x86_64-linux-ghc-8.0.1/TrabalhoFinal-0.0.1"
dynlibdir  = "/home/daniel/.cabal/lib/x86_64-linux-ghc-8.0.1"
datadir    = "/home/daniel/.cabal/share/x86_64-linux-ghc-8.0.1/TrabalhoFinal-0.0.1"
libexecdir = "/home/daniel/.cabal/libexec"
sysconfdir = "/home/daniel/.cabal/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "TrabalhoFinal_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "TrabalhoFinal_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "TrabalhoFinal_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "TrabalhoFinal_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "TrabalhoFinal_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "TrabalhoFinal_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
