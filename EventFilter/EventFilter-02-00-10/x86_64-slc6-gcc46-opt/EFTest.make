#-- start of make_header -----------------

#====================================
#  Library EFTest
#
#   Generated Mon Mar 23 20:58:51 2020  by boss
#
#====================================

include ${CMTROOT}/src/Makefile.core

ifdef tag
CMTEXTRATAGS = $(tag)
else
tag       = $(CMTCONFIG)
endif

cmt_EFTest_has_no_target_tag = 1

#--------------------------------------------------------

ifdef cmt_EFTest_has_target_tag

tags      = $(tag),$(CMTEXTRATAGS),target_EFTest

EventFilter_tag = $(tag)

#cmt_local_tagfile_EFTest = $(EventFilter_tag)_EFTest.make
cmt_local_tagfile_EFTest = $(bin)$(EventFilter_tag)_EFTest.make

else

tags      = $(tag),$(CMTEXTRATAGS)

EventFilter_tag = $(tag)

#cmt_local_tagfile_EFTest = $(EventFilter_tag).make
cmt_local_tagfile_EFTest = $(bin)$(EventFilter_tag).make

endif

include $(cmt_local_tagfile_EFTest)
#-include $(cmt_local_tagfile_EFTest)

ifdef cmt_EFTest_has_target_tag

cmt_final_setup_EFTest = $(bin)setup_EFTest.make
cmt_dependencies_in_EFTest = $(bin)dependencies_EFTest.in
#cmt_final_setup_EFTest = $(bin)EventFilter_EFTestsetup.make
cmt_local_EFTest_makefile = $(bin)EFTest.make

else

cmt_final_setup_EFTest = $(bin)setup.make
cmt_dependencies_in_EFTest = $(bin)dependencies.in
#cmt_final_setup_EFTest = $(bin)EventFiltersetup.make
cmt_local_EFTest_makefile = $(bin)EFTest.make

endif

#cmt_final_setup = $(bin)setup.make
#cmt_final_setup = $(bin)EventFiltersetup.make

#EFTest :: ;

dirs ::
	@if test ! -r requirements ; then echo "No requirements file" ; fi; \
	  if test ! -d $(bin) ; then $(mkdir) -p $(bin) ; fi

javadirs ::
	@if test ! -d $(javabin) ; then $(mkdir) -p $(javabin) ; fi

srcdirs ::
	@if test ! -d $(src) ; then $(mkdir) -p $(src) ; fi

help ::
	$(echo) 'EFTest'

binobj = 
ifdef STRUCTURED_OUTPUT
binobj = EFTest/
#EFTest::
#	@if test ! -d $(bin)$(binobj) ; then $(mkdir) -p $(bin)$(binobj) ; fi
#	$(echo) "STRUCTURED_OUTPUT="$(bin)$(binobj)
endif

${CMTROOT}/src/Makefile.core : ;
ifdef use_requirements
$(use_requirements) : ;
endif

#-- end of make_header ------------------
#-- start of libary_header ---------------

EFTestlibname   = $(bin)$(library_prefix)EFTest$(library_suffix)
EFTestlib       = $(EFTestlibname).a
EFTeststamp     = $(bin)EFTest.stamp
EFTestshstamp   = $(bin)EFTest.shstamp

EFTest :: dirs  EFTestLIB
	$(echo) "EFTest ok"

#-- end of libary_header ----------------

EFTestLIB :: $(EFTestlib) $(EFTestshstamp)
	@/bin/echo "------> EFTest : library ok"

$(EFTestlib) :: $(bin)EFTest.o $(bin)EFTest_entries.o $(bin)EFTest_load.o
	$(lib_echo) library
	$(lib_silent) cd $(bin); \
	  $(ar) $(EFTestlib) $?
	$(lib_silent) $(ranlib) $(EFTestlib)
	$(lib_silent) cat /dev/null >$(EFTeststamp)

#------------------------------------------------------------------
#  Future improvement? to empty the object files after
#  storing in the library
#
##	  for f in $?; do \
##	    rm $${f}; touch $${f}; \
##	  done
#------------------------------------------------------------------

$(EFTestlibname).$(shlibsuffix) :: $(EFTestlib) $(EFTeststamps)
	$(lib_silent) cd $(bin); QUIET=$(QUIET); $(make_shlib) "$(tags)" EFTest $(EFTest_shlibflags)

$(EFTestshstamp) :: $(EFTestlibname).$(shlibsuffix)
	@if test -f $(EFTestlibname).$(shlibsuffix) ; then cat /dev/null >$(EFTestshstamp) ; fi

EFTestclean ::
	$(cleanup_echo) objects
	$(cleanup_silent) cd $(bin); /bin/rm -f $(bin)EFTest.o $(bin)EFTest_entries.o $(bin)EFTest_load.o

#-----------------------------------------------------------------
#
#  New section for automatic installation
#
#-----------------------------------------------------------------

ifeq ($(INSTALLAREA),)
installarea = $(CMTINSTALLAREA)
else
ifeq ($(findstring `,$(INSTALLAREA)),`)
installarea = $(shell $(subst `,, $(INSTALLAREA)))
else
installarea = $(INSTALLAREA)
endif
endif

install_dir = ${installarea}/${CMTCONFIG}/lib
EFTestinstallname = $(library_prefix)EFTest$(library_suffix).$(shlibsuffix)

EFTest :: EFTestinstall

install :: EFTestinstall

EFTestinstall :: $(install_dir)/$(EFTestinstallname)
	@if test ! "${installarea}" = ""; then\
	  echo "installation done"; \
	fi

$(install_dir)/$(EFTestinstallname) :: $(bin)$(EFTestinstallname)
	@if test ! "${installarea}" = ""; then \
	  cd $(bin); \
	  if test ! "$(install_dir)" = ""; then \
	    if test ! -d "$(install_dir)"; then \
	      mkdir -p $(install_dir); \
	    fi ; \
	    if test -d "$(install_dir)"; then \
	      echo "Installing library $(EFTestinstallname) into $(install_dir)"; \
	      if test -e $(install_dir)/$(EFTestinstallname); then \
	        $(cmt_uninstall_area_command) $(install_dir)/$(EFTestinstallname); \
	        $(cmt_uninstall_area_command) $(install_dir)/$(EFTestinstallname).cmtref; \
	      fi; \
	      $(cmt_install_area_command) `pwd`/$(EFTestinstallname) $(install_dir)/$(EFTestinstallname); \
	      echo `pwd`/$(EFTestinstallname) >$(install_dir)/$(EFTestinstallname).cmtref; \
	    fi \
          else \
	    echo "Cannot install library $(EFTestinstallname), no installation directory specified"; \
	  fi; \
	fi

EFTestclean :: EFTestuninstall

uninstall :: EFTestuninstall

EFTestuninstall ::
	@if test ! "${installarea}" = ""; then \
	  cd $(bin); \
	  if test ! "$(install_dir)" = ""; then \
	    if test -d "$(install_dir)"; then \
	      echo "Removing installed library $(EFTestinstallname) from $(install_dir)"; \
	      $(cmt_uninstall_area_command) $(install_dir)/$(EFTestinstallname); \
	      $(cmt_uninstall_area_command) $(install_dir)/$(EFTestinstallname).cmtref; \
	    fi \
          else \
	    echo "Cannot uninstall library $(EFTestinstallname), no installation directory specified"; \
	  fi; \
	fi




#-- start of cpp_library -----------------

ifneq (-MMD -MP -MF $*.d -MQ $@,)

ifneq ($(MAKECMDGOALS),EFTestclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)EFTest.d

$(bin)$(binobj)EFTest.d :

$(bin)$(binobj)EFTest.o : $(cmt_final_setup_EFTest)

$(bin)$(binobj)EFTest.o : $(src)EFTest.cxx
	$(cpp_echo) $(src)EFTest.cxx
	$(cpp_silent) $(cppcomp) -MMD -MP -MF $*.d -MQ $@ -o $@ $(use_pp_cppflags) $(EFTest_pp_cppflags) $(lib_EFTest_pp_cppflags) $(EFTest_pp_cppflags) $(use_cppflags) $(EFTest_cppflags) $(lib_EFTest_cppflags) $(EFTest_cppflags) $(EFTest_cxx_cppflags)  $(src)EFTest.cxx
endif
endif

else
$(bin)EFTest_dependencies.make : $(EFTest_cxx_dependencies)

$(bin)EFTest_dependencies.make : $(src)EFTest.cxx

$(bin)$(binobj)EFTest.o : $(EFTest_cxx_dependencies)
	$(cpp_echo) $(src)EFTest.cxx
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(EFTest_pp_cppflags) $(lib_EFTest_pp_cppflags) $(EFTest_pp_cppflags) $(use_cppflags) $(EFTest_cppflags) $(lib_EFTest_cppflags) $(EFTest_cppflags) $(EFTest_cxx_cppflags)  $(src)EFTest.cxx

endif

#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq (-MMD -MP -MF $*.d -MQ $@,)

ifneq ($(MAKECMDGOALS),EFTestclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)EFTest_entries.d

$(bin)$(binobj)EFTest_entries.d :

$(bin)$(binobj)EFTest_entries.o : $(cmt_final_setup_EFTest)

$(bin)$(binobj)EFTest_entries.o : $(src)components/EFTest_entries.cxx
	$(cpp_echo) $(src)components/EFTest_entries.cxx
	$(cpp_silent) $(cppcomp) -MMD -MP -MF $*.d -MQ $@ -o $@ $(use_pp_cppflags) $(EFTest_pp_cppflags) $(lib_EFTest_pp_cppflags) $(EFTest_entries_pp_cppflags) $(use_cppflags) $(EFTest_cppflags) $(lib_EFTest_cppflags) $(EFTest_entries_cppflags) $(EFTest_entries_cxx_cppflags) -I../src/components $(src)components/EFTest_entries.cxx
endif
endif

else
$(bin)EFTest_dependencies.make : $(EFTest_entries_cxx_dependencies)

$(bin)EFTest_dependencies.make : $(src)components/EFTest_entries.cxx

$(bin)$(binobj)EFTest_entries.o : $(EFTest_entries_cxx_dependencies)
	$(cpp_echo) $(src)components/EFTest_entries.cxx
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(EFTest_pp_cppflags) $(lib_EFTest_pp_cppflags) $(EFTest_entries_pp_cppflags) $(use_cppflags) $(EFTest_cppflags) $(lib_EFTest_cppflags) $(EFTest_entries_cppflags) $(EFTest_entries_cxx_cppflags) -I../src/components $(src)components/EFTest_entries.cxx

endif

#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq (-MMD -MP -MF $*.d -MQ $@,)

ifneq ($(MAKECMDGOALS),EFTestclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)EFTest_load.d

$(bin)$(binobj)EFTest_load.d :

$(bin)$(binobj)EFTest_load.o : $(cmt_final_setup_EFTest)

$(bin)$(binobj)EFTest_load.o : $(src)components/EFTest_load.cxx
	$(cpp_echo) $(src)components/EFTest_load.cxx
	$(cpp_silent) $(cppcomp) -MMD -MP -MF $*.d -MQ $@ -o $@ $(use_pp_cppflags) $(EFTest_pp_cppflags) $(lib_EFTest_pp_cppflags) $(EFTest_load_pp_cppflags) $(use_cppflags) $(EFTest_cppflags) $(lib_EFTest_cppflags) $(EFTest_load_cppflags) $(EFTest_load_cxx_cppflags) -I../src/components $(src)components/EFTest_load.cxx
endif
endif

else
$(bin)EFTest_dependencies.make : $(EFTest_load_cxx_dependencies)

$(bin)EFTest_dependencies.make : $(src)components/EFTest_load.cxx

$(bin)$(binobj)EFTest_load.o : $(EFTest_load_cxx_dependencies)
	$(cpp_echo) $(src)components/EFTest_load.cxx
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(EFTest_pp_cppflags) $(lib_EFTest_pp_cppflags) $(EFTest_load_pp_cppflags) $(use_cppflags) $(EFTest_cppflags) $(lib_EFTest_cppflags) $(EFTest_load_cppflags) $(EFTest_load_cxx_cppflags) -I../src/components $(src)components/EFTest_load.cxx

endif

#-- end of cpp_library ------------------
#-- start of cleanup_header --------------

clean :: EFTestclean ;
#	@cd .

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(EFTest.make) $@: No rule for such target" >&2
else
.DEFAULT::
	$(error PEDANTIC: $@: No rule for such target)
endif

EFTestclean ::
#-- end of cleanup_header ---------------
#-- start of cleanup_library -------------
	$(cleanup_echo) library EFTest
	-$(cleanup_silent) cd $(bin); /bin/rm -f $(library_prefix)EFTest$(library_suffix).a $(library_prefix)EFTest$(library_suffix).s? EFTest.stamp EFTest.shstamp
#-- end of cleanup_library ---------------
