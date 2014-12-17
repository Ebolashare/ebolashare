AM_CPPFLAGS =  $(INCLUDES) -I$(top_builddir)/src/obj \
  -I$(top_srcdir)/src/leveldb/include -I$(top_srcdir)/src/leveldb/helpers \
  $(BOOST_INCLUDES)
AM_LDFLAGS = $(PTHREAD_CFLAGS)

noinst_LIBRARIES = libbitcoin.a

bin_PROGRAMS = bitcoind

SUBDIRS = . $(BUILD_QT) $(BUILD_TEST)
DIST_SUBDIRS = . qt test
.PHONY: FORCE
# bitcoin core #
BITCOIN_CORE_H = addrman.h alert.h allocators.h base58.h bignum.h \
  bitcoinrpc.h bloom.h checkpoints.h checkqueue.h \
  clientversion.h compat.h crypter.h db.h hash.h hashblock.h init.h irc.h \
  key.h kernel.h keystore.h limitedmap.h main.h miner.h mruset.h \
  netbase.h net.h pbkdf2.h protocol.h script.h scrypt.h serialize.h sync.h threadsafety.h \
  txdb.h txdb-leveldb.h ui_interface.h uint256.h util.h version.h walletdb.h wallet.h \
  sph_blake.h sph_bmw.h sph_cubehash.h sph_echo.h sph_groestl.h sph_jh.h sph_keccak.h \
  sph_luffa.h sph_shavite.h sph_simd.h sph_skein.h sph_fugue.h sph_hamsi.h sph_types.h

JSON_H = json/json_spirit.h json/json_spirit_error_position.h \
  json/json_spirit_reader.h json/json_spirit_reader_template.h \
  json/json_spirit_stream_reader.h json/json_spirit_utils.h \
  json/json_spirit_value.h json/json_spirit_writer.h \
  json/json_spirit_writer_template.h

obj/build.h: FORCE
	@$(MKDIR_P) $(abs_top_builddir)/src/obj
	@$(top_srcdir)/share/genbuild.sh $(abs_top_builddir)/src/obj/build.h \
	  $(abs_top_srcdir)
version.o: obj/build.h

libbitcoin_a_SOURCES = addrman.cpp alert.cpp bitcoinrpc.cpp bloom.cpp \
  checkpoints.cpp crypter.cpp db.cpp hash.cpp init.cpp irc.cpp \
  key.cpp kernel.cpp keystore.cpp main.cpp miner.cpp \
  netbase.cpp net.cpp noui.cpp pbkdf2.cpp protocol.cpp rpcblockchain.cpp rpcdump.cpp \
  rpcmining.cpp rpcnet.cpp rpcrawtransaction.cpp rpcwallet.cpp script.cpp \
  scrypt.cpp sync.cpp txdb-leveldb.cpp util.cpp version.cpp wallet.cpp walletdb.cpp $(JSON_H) \
  $(BITCOIN_CORE_H)

nodist_libbitcoin_a_SOURCES = $(top_srcdir)/src/obj/build.h \
aes_helper.c blake.c bmw.c cubehash.c echo.c groestl.c jh.c keccak.c luffa.c \
  shavite.c simd.c skein.c fugue.c hamsi.c
#

# bitcoind binary #
bitcoind_LDADD = libbitcoin.a leveldb/libleveldb.a leveldb/libmemenv.a \
  $(BOOST_LIBS)
bitcoind_SOURCES = bitcoind.cpp
#

AM_CPPFLAGS += $(BDB_CPPFLAGS)
bitcoind_LDADD += $(BDB_LIBS)

leveldb/libleveldb.a:
	@echo "Building LevelDB ..." && cd leveldb && CXX="$(CXX)" CC="$(CC)" \
	  PLATFORM=$(TARGET_OS) AR="$(AR)" $(MAKE) $(LEVELDB_TARGET_FLAGS) OPT="$(CXXFLAGS) $(CPPFLAGS)" libleveldb.a

leveldb/libmemenv.a:
	@echo "Building LevelDB ..." && cd leveldb && CXX="$(CXX)" CC="$(CC)" \
	  PLATFORM=$(TARGET_OS) AR="$(AR)" $(MAKE) $(LEVELDB_TARGET_FLAGS) OPT="$(CXXFLAGS) $(CPPFLAGS)" libmemenv.a

CLEANFILES = leveldb/libleveldb.a leveldb/libmemenv.a *.gcda *.gcno

DISTCLEANFILES = obj/build.h

EXTRA_DIST = leveldb Makefile.include

clean-local:
	-$(MAKE) -C leveldb clean
	rm -f leveldb/port/*.gcno leveldb/db/*.gcno leveldb/table/*.gcno leveldb/helpers/*.gcno
	rm -f leveldb/util/*.gcno leveldb/helpers/memenv/*.gcno