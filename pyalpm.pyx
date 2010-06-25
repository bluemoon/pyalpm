cdef extern from "stdio.h":
   int printf(char*,...)


cdef extern from "alpm_list.h":

    ctypedef struct alpm_list_t:
        pass
    ctypedef alpm_list_t* const_alpm "const alpm_list_t*"

    alpm_list_t *alpm_list_next(const_alpm List)
    
    ctypedef class pyalpm.alist [object alpm_list_t]:        
        cdef:
            void *data
            alpm_list_t *prev
            alpm_list_t *next
        
    #        
    #    def __getbuffer__(alist self, Py_buffer* info, int flags):
    #        pass


cdef extern from "alpm.h":
    ctypedef char* const_char "const char*"

    ctypedef struct pmdb_t:
        pass
    ctypedef struct pmpkg_t:
        pass
    
    cdef int alpm_initialize()
    cdef int alpm_release()
    
    cdef const_char alpm_option_get_root()
    cdef int alpm_option_set_root(const_char root)
    cdef const_char alpm_option_get_dbpath()
    cdef int alpm_option_set_dbpath(const_char dbpath)
    
    cdef alpm_list_t *alpm_option_get_cachedirs()
    cdef int alpm_option_add_cachedir(char *cachedir)
    cdef alpm_option_set_cachedirs(alpm_list_t *cachedirs)
    cdef int alpm_option_remove_cachedir(char *cachedir)

    cdef char *alpm_option_get_logfile()
    cdef int alpm_option_set_logfile(char *logfile)

    cdef char *alpm_option_get_lockfile()
    #    /* no set_lockfile, path is determined from dbpath */

    #unsigned short alpm_option_get_usesyslog();
    #void alpm_option_set_usesyslog(unsigned short usesyslog);

    #alpm_list_t *alpm_option_get_noupgrades();
    #void alpm_option_add_noupgrade(const char *pkg);
    #void alpm_option_set_noupgrades(alpm_list_t *noupgrade);
    #int alpm_option_remove_noupgrade(const char *pkg);

    #alpm_list_t *alpm_option_get_noextracts();
    #void alpm_option_add_noextract(const char *pkg);
    #void alpm_option_set_noextracts(alpm_list_t *noextract);
    #int alpm_option_remove_noextract(const char *pkg);

    #alpm_list_t *alpm_option_get_ignorepkgs();
    #void alpm_option_add_ignorepkg(const char *pkg);
    #void alpm_option_set_ignorepkgs(alpm_list_t *ignorepkgs);
    #int alpm_option_remove_ignorepkg(const char *pkg);

    #alpm_list_t *alpm_option_get_ignoregrps();
    #void alpm_option_add_ignoregrp(const char *grp);
    #void alpm_option_set_ignoregrps(alpm_list_t *ignoregrps);
    #int alpm_option_remove_ignoregrp(const char *grp);

    #unsigned short alpm_option_get_nopassiveftp();
    #void alpm_option_set_nopassiveftp(unsigned short nopasv);
    #void alpm_option_set_usedelta(unsigned short usedelta);

    cdef pmdb_t *alpm_option_get_localdb()
    cdef alpm_list_t *alpm_option_get_syncdbs()

    cdef pmdb_t *alpm_db_register_local()
    cdef pmdb_t *alpm_db_register_sync(const_char treename)
    cdef int alpm_db_unregister(pmdb_t *db)
    cdef int alpm_db_unregister_all()

    cdef int *alpm_db_get_name(pmdb_t *db)
    char *alpm_db_get_url(pmdb_t *db)

    cdef int alpm_db_setserver(pmdb_t *db, char *url)
    cdef int alpm_db_update(int level, pmdb_t *db)

    # pmpkg_t *alpm_db_get_pkg(pmdb_t *db, const char *name);
    cdef alpm_list_t *alpm_db_get_pkgcache(pmdb_t *db)
    
    # pmgrp_t *alpm_db_readgrp(pmdb_t *db, const char *name);
    # alpm_list_t *alpm_db_get_grpcache(pmdb_t *db);
    cdef alpm_list_t *alpm_db_search(pmdb_t *db, alpm_list_t *needles)
    
    cdef int alpm_pkg_load(char *filename, short full, pmpkg_t **pkg)
    cdef int alpm_pkg_free(pmpkg_t *pkg)
    cdef int alpm_pkg_checkmd5sum(pmpkg_t *pkg)
    cdef char *alpm_fetch_pkgurl(char *url)
    cdef int alpm_pkg_vercmp(char *a, char *b)
    cdef alpm_list_t *alpm_pkg_compute_requiredby(pmpkg_t *pkg)
    
    cdef char *alpm_pkg_get_filename(pmpkg_t *pkg)
    cdef const_char alpm_pkg_get_name(pmpkg_t *pkg)
    cdef char *alpm_pkg_get_version(pmpkg_t *pkg)
    cdef char *alpm_pkg_get_desc(pmpkg_t *pkg)
    cdef char *alpm_pkg_get_url(pmpkg_t *pkg)
    #time_t alpm_pkg_get_builddate(pmpkg_t *pkg);
    #time_t alpm_pkg_get_installdate(pmpkg_t *pkg);
    #const char *alpm_pkg_get_packager(pmpkg_t *pkg);
    #const char *alpm_pkg_get_md5sum(pmpkg_t *pkg);
    #const char *alpm_pkg_get_arch(pmpkg_t *pkg);
    #off_t alpm_pkg_get_size(pmpkg_t *pkg);
    #off_t alpm_pkg_get_isize(pmpkg_t *pkg);
    #pmpkgreason_t alpm_pkg_get_reason(pmpkg_t *pkg);
    #alpm_list_t *alpm_pkg_get_licenses(pmpkg_t *pkg);
    #alpm_list_t *alpm_pkg_get_groups(pmpkg_t *pkg);
    #alpm_list_t *alpm_pkg_get_depends(pmpkg_t *pkg);
    #alpm_list_t *alpm_pkg_get_optdepends(pmpkg_t *pkg);
    #alpm_list_t *alpm_pkg_get_conflicts(pmpkg_t *pkg);
    #alpm_list_t *alpm_pkg_get_provides(pmpkg_t *pkg);
    #alpm_list_t *alpm_pkg_get_deltas(pmpkg_t *pkg);
    #alpm_list_t *alpm_pkg_get_replaces(pmpkg_t *pkg);
    #alpm_list_t *alpm_pkg_get_files(pmpkg_t *pkg);
    #alpm_list_t *alpm_pkg_get_backup(pmpkg_t *pkg);
    #alpm_list_t *alpm_pkg_get_removes(pmpkg_t *pkg);
    #pmdb_t *alpm_pkg_get_db(pmpkg_t *pkg);
    #void *alpm_pkg_changelog_open(pmpkg_t *pkg);
    #size_t alpm_pkg_changelog_read(void *ptr, size_t size,
    #                               const pmpkg_t *pkg, const void *fp);
    #/*int alpm_pkg_changelog_feof(const pmpkg_t *pkg, void *fp);*/
    #int alpm_pkg_changelog_close(const pmpkg_t *pkg, void *fp);
    #unsigned short alpm_pkg_has_scriptlet(pmpkg_t *pkg);
    #unsigned short alpm_pkg_has_force(pmpkg_t *pkg);
    
    #off_t alpm_pkg_download_size(pmpkg_t *newpkg);

cdef class alpm:
    cdef pmdb_t *db
    
    def __dealloc__(self):
        alpm_release()
        
    def __init__(self):
        if alpm_initialize() != 0:
            raise Exception('InitError')
        
        cdef int ret = alpm_option_set_root("/")
        alpm_option_set_dbpath("/var/lib/pacman")
        #self.repos = ['core', 'extra', 'community']

        self.db = self.add_db('core')
        
    cdef pmdb_t *add_db(self, name):
        return alpm_db_register_sync(name)
        
    def search_by(self):
        cdef alpm_list_t *i = alpm_db_get_pkgcache(self.db)
        while i:
            cdef pmpkg_t *pkg = alpm_list_getdata(i)
            i = alpm_list_next(i)


    
