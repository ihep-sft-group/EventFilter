#-- start of make_header -----------------

#====================================
#  Library EFServices
#
#   Generated Mon Mar 23 20:56:37 2020  by boss
#
#====================================

include ${CMTROOT}/src/Makefile.core

ifdef tag
CMTEXTRATAGS = $(tag)
else
tag       = $(CMTCONFIG)
endif

cmt_EFServices_has_no_target_tag = 1

#--------------------------------------------------------

ifdef cmt_EFServices_has_target_tag

tags      = $(tag),$(CMTEXTRATAGS),target_EFServices

EFServices_tag = $(tag)

#cmt_local_tagfile_EFServices = $(EFServices_tag)_EFServices.make
cmt_local_tagfile_EFServices = $(bin)$(EFServices_tag)_EFServices.make

else

tags      = $(tag),$(CMTEXTRATAGS)

EFServices_tag = $(tag)

#cmt_local_tagfile_EFServices = $(EFServices_tag).make
cmt_local_tagfile_EFServices = $(bin)$(EFServices_tag).make

endif

include $(cmt_local_tagfile_EFServices)
#-include $(cmt_local_tagfile_EFServices)

ifdef cmt_EFServices_has_target_tag

cmt_final_setup_EFServices = $(bin)setup_EFServices.make
cmt_dependencies_in_EFServices = $(bin)dependencies_EFServices.in
#cmt_final_setup_EFServices = $(bin)EFServices_EFServicessetup.make
cmt_local_EFServices_makefile = $(bin)EFServices.make

else

cmt_final_setup_EFServices = $(bin)setup.make
cmt_dependencies_in_EFServices = $(bin)dependencies.in
#cmt_final_setup_EFServices = $(bin)EFServicessetup.make
cmt_local_EFServices_makefile = $(bin)EFServices.make

endif

#cmt_final_setup = $(bin)setup.make
#cmt_final_setup = $(bin)EFServicessetup.make

#EFServices :: ;

dirs ::
	@if test ! -r requirements ; then echo "No requirements file" ; fi; \
	  if test ! -d $(bin) ; then $(mkdir) -p $(bin) ; fi

javadirs ::
	@if test ! -d $(javabin) ; then $(mkdir) -p $(javabin) ; fi

srcdirs ::
	@if test ! -d $(src) ; then $(mkdir) -p $(src) ; fi

help ::
	$(echo) 'EFServices'

binobj = 
ifdef STRUCTURED_OUTPUT
binobj = EFServices/
#EFServices::
#	@if test ! -d $(bin)$(binobj) ; then $(mkdir) -p $(bin)$(binobj) ; fi
#	$(echo) "STRUCTURED_OUTPUT="$(bin)$(binobj)
endif

${CMTROOT}/src/Makefile.core : ;
ifdef use_requirements
$(use_requirements) : ;
endif

#-- end of make_header ------------------
#-- start of libary_header ---------------

EFServiceslibname   = $(bin)$(library_prefix)EFServices$(library_suffix)
EFServiceslib       = $(EFServiceslibname).a
EFServicesstamp     = $(bin)EFServices.stamp
EFServicesshstamp   = $(bin)EFServices.shstamp

EFServices :: dirs  EFServicesLIB
	$(echo) "EFServices ok"

#-- end of libary_header ----------------

EFServicesLIB :: $(EFServiceslib) $(EFServicesshstamp)
	@/bin/echo "------> EFServices : library ok"

$(EFServiceslib) :: $(bin)EFEventLoopMgr.o $(bin)EFServices_entries.o $(bin)EFServices_load.o
	$(lib_echo) library
	$(lib_silent) cd $(bin); \
	  $(ar) $(EFServiceslib) $?
	$(lib_silent) $(ranlib) $(EFServiceslib)
	$(lib_silent) cat /dev/null >$(EFServicesstamp)

#------------------------------------------------------------------
#  Future improvement? to empty the object files after
#  storing in the library
#
##	  for f in $?; do \
##	    rm $${f}; touch $${f}; \
##	  done
#------------------------------------------------------------------

$(EFServiceslibname).$(shlibsuffix) :: $(EFServiceslib) $(EFServicesstamps)
	$(lib_silent) cd $(bin); QUIET=$(QUIET); $(make_shlib) "$(tags)" EFServices $(EFServices_shlibflags)

$(EFServicesshstamp) :: $(EFServiceslibname).$(shlibsuffix)
	@if test -f $(EFServiceslibname).$(shlibsuffix) ; then cat /dev/null >$(EFServicesshstamp) ; fi

EFServicesclean ::
	$(cleanup_echo) objects
	$(cleanup_silent) cd $(bin); /bin/rm -f $(bin)EFEventLoopMgr.o $(bin)EFServices_entries.o $(bin)EFServices_load.o

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
EFServicesinstallname = $(library_prefix)EFServices$(library_suffix).$(shlibsuffix)

EFServices :: EFServicesinstall

install :: EFServicesinstall

EFServicesinstall :: $(install_dir)/$(EFServicesinstallname)
	@if test ! "${installarea}" = ""; then\
	  echo "installation done"; \
	fi

$(install_dir)/$(EFServicesinstallname) :: $(bin)$(EFServicesinstallname)
	@if test ! "${installarea}" = ""; then \
	  cd $(bin); \
	  if test ! "$(install_dir)" = ""; then \
	    if test ! -d "$(install_dir)"; then \
	      mkdir -p $(install_dir); \
	    fi ; \
	    if test -d "$(install_dir)"; then \
	      echo "Installing library $(EFServicesinstallname) into $(install_dir)"; \
	      if test -e $(install_dir)/$(EFServicesinstallname); then \
	        $(cmt_uninstall_area_command) $(install_dir)/$(EFServicesinstallname); \
	        $(cmt_uninstall_area_command) $(install_dir)/$(EFServicesinstallname).cmtref; \
	      fi; \
	      $(cmt_install_area_command) `pwd`/$(EFServicesinstallname) $(install_dir)/$(EFServicesinstallname); \
	      echo `pwd`/$(EFServicesinstallname) >$(install_dir)/$(EFServicesinstallname).cmtref; \
	    fi \
          else \
	    echo "Cannot install library $(EFServicesinstallname), no installation directory specified"; \
	  fi; \
	fi

EFServicesclean :: EFServicesuninstall

uninstall :: EFServicesuninstall

EFServicesuninstall ::
	@if test ! "${installarea}" = ""; then \
	  cd $(bin); \
	  if test ! "$(install_dir)" = ""; then \
	    if test -d "$(install_dir)"; then \
	      echo "Removing installed library $(EFServicesinstallname) from $(install_dir)"; \
	      $(cmt_uninstall_area_command) $(install_dir)/$(EFServicesinstallname); \
	      $(cmt_uninstall_area_command) $(install_dir)/$(EFServicesinstallname).cmtref; \
	    fi \
          else \
	    echo "Cannot uninstall library $(EFServicesinstallname), no installation directory specified"; \
	  fi; \
	fi




#-- start of cpp_library -----------------

ifneq (-MMD -MP -MF $*.d -MQ $@,)

ifneq ($(MAKECMDGOALS),EFServicesclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)EFEventLoopMgr.d

$(bin)$(binobj)EFEventLoopMgr.d :

$(bin)$(binobj)EFEventLoopMgr.o : $(cmt_final_setup_EFServices)

$(bin)$(binobj)EFEventLoopMgr.o : $(src)EFEventLoopMgr.cxx
	$(cpp_echo) $(src)EFEventLoopMgr.cxx
	$(cpp_silent) $(cppcomp) -MMD -MP -MF $*.d -MQ $@ -o $@ $(use_pp_cppflags) $(EFServices_pp_cppflags) $(lib_EFServices_pp_cppflags) $(EFEventLoopMgr_pp_cppflags) $(use_cppflags) $(EFServices_cppflags) $(lib_EFServices_cppflags) $(EFEventLoopMgr_cppflags) $(EFEventLoopMgr_cxx_cppflags)  $(src)EFEventLoopMgr.cxx
endif
endif

else
$(bin)EFServices_dependencies.make : $(EFEventLoopMgr_cxx_dependencies)

$(bin)EFServices_dependencies.make : $(src)EFEventLoopMgr.cxx

$(bin)$(binobj)EFEventLoopMgr.o : $(EFEventLoopMgr_cxx_dependencies)
	$(cpp_echo) $(src)EFEventLoopMgr.cxx
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(EFServices_pp_cppflags) $(lib_EFServices_pp_cppflags) $(EFEventLoopMgr_pp_cppflags) $(use_cppflags) $(EFServices_cppflags) $(lib_EFServices_cppflags) $(EFEventLoopMgr_cppflags) $(EFEventLoopMgr_cxx_cppflags)  $(src)EFEventLoopMgr.cxx

endif

#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq (-MMD -MP -MF $*.d -MQ $@,)

ifneq ($(MAKECMDGOALS),EFServicesclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)EFServices_entries.d

$(bin)$(binobj)EFServices_entries.d :

$(bin)$(binobj)EFServices_entries.o : $(cmt_final_setup_EFServices)

$(bin)$(binobj)EFServices_entries.o : $(src)components/EFServices_entries.cxx
	$(cpp_echo) $(src)components/EFServices_entries.cxx
	$(cpp_silent) $(cppcomp) -MMD -MP -MF $*.d -MQ $@ -o $@ $(use_pp_cppflags) $(EFServices_pp_cppflags) $(lib_EFServices_pp_cppflags) $(EFServices_entries_pp_cppflags) $(use_cppflags) $(EFServices_cppflags) $(lib_EFServices_cppflags) $(EFServices_entries_cppflags) $(EFServices_entries_cxx_cppflags) -I../src/components $(src)components/EFServices_entries.cxx
endif
endif

else
$(bin)EFServices_dependencies.make : $(EFServices_entries_cxx_dependencies)

$(bin)EFServices_dependencies.make : $(src)components/EFServices_entries.cxx

$(bin)$(binobj)EFServices_entries.o : $(EFServices_entries_cxx_dependencies)
	$(cpp_echo) $(src)components/EFServices_entries.cxx
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(EFServices_pp_cppflags) $(lib_EFServices_pp_cppflags) $(EFServices_entries_pp_cppflags) $(use_cppflags) $(EFServices_cppflags) $(lib_EFServices_cppflags) $(EFServices_entries_cppflags) $(EFServices_entries_cxx_cppflags) -I../src/components $(src)components/EFServices_entries.cxx

endif

#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq (-MMD -MP -MF $*.d -MQ $@,)

ifneq ($(MAKECMDGOALS),EFServicesclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)EFServices_load.d

$(bin)$(binobj)EFServices_load.d :

$(bin)$(binobj)EFServices_load.o : $(cmt_final_setup_EFServices)

$(bin)$(binobj)EFServices_load.o : $(src)components/EFServices_load.cxx
	$(cpp_echo) $(src)components/EFServices_load.cxx
	$(cpp_silent) $(cppcomp) -MMD -MP -MF $*.d -MQ $@ -o $@ $(use_pp_cppflags) $(EFServices_pp_cppflags) $(lib_EFServices_pp_cppflags) $(EFServices_load_pp_cppflags) $(use_cppflags) $(EFServices_cppflags) $(lib_EFServices_cppflags) $(EFServices_load_cppflags) $(EFServices_load_cxx_cppflags) -I../src/components $(src)components/EFServices_load.cxx
endif
endif

else
$(bin)EFServices_dependencies.make : $(EFServices_load_cxx_dependencies)

$(bin)EFServices_dependencies.make : $(src)components/EFServices_load.cxx

$(bin)$(binobj)EFServices_load.o : $(EFServices_load_cxx_dependencies)
	$(cpp_echo) $(src)components/EFServices_load.cxx
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(EFServices_pp_cppflags) $(lib_EFServices_pp_cppflags) $(EFServices_load_pp_cppflags) $(use_cppflags) $(EFServices_cppflags) $(lib_EFServices_cppflags) $(EFServices_load_cppflags) $(EFServices_load_cxx_cppflags) -I../src/components $(src)components/EFServices_load.cxx

endif

#-- end of cpp_library ------------------
#-- start of cleanup_header --------------

clean :: EFServicesclean ;
#	@cd .

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(EFServices.make) $@: No rule for such target" >&2
else
.DEFAULT::
	$(error PEDANTIC: $@: No rule for such target)
endif

EFServicesclean ::
#-- end of cleanup_header ---------------
#-- start of cleanup_library -------------
	$(cleanup_echo) library EFServices
	-$(cleanup_silent) cd $(bin); /bin/rm -f $(library_prefix)EFServices$(library_suffix).a $(library_prefix)EFServices$(library_suffix).s? EFServices.stamp EFServices.shstamp
#-- end of cleanup_library ---------------
