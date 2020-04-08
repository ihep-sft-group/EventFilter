#-- start of make_header -----------------

#====================================
#  Library EventFilter
#
#   Generated Mon Mar 23 20:58:04 2020  by boss
#
#====================================

include ${CMTROOT}/src/Makefile.core

ifdef tag
CMTEXTRATAGS = $(tag)
else
tag       = $(CMTCONFIG)
endif

cmt_EventFilter_has_no_target_tag = 1

#--------------------------------------------------------

ifdef cmt_EventFilter_has_target_tag

tags      = $(tag),$(CMTEXTRATAGS),target_EventFilter

EventFilter_tag = $(tag)

#cmt_local_tagfile_EventFilter = $(EventFilter_tag)_EventFilter.make
cmt_local_tagfile_EventFilter = $(bin)$(EventFilter_tag)_EventFilter.make

else

tags      = $(tag),$(CMTEXTRATAGS)

EventFilter_tag = $(tag)

#cmt_local_tagfile_EventFilter = $(EventFilter_tag).make
cmt_local_tagfile_EventFilter = $(bin)$(EventFilter_tag).make

endif

include $(cmt_local_tagfile_EventFilter)
#-include $(cmt_local_tagfile_EventFilter)

ifdef cmt_EventFilter_has_target_tag

cmt_final_setup_EventFilter = $(bin)setup_EventFilter.make
cmt_dependencies_in_EventFilter = $(bin)dependencies_EventFilter.in
#cmt_final_setup_EventFilter = $(bin)EventFilter_EventFiltersetup.make
cmt_local_EventFilter_makefile = $(bin)EventFilter.make

else

cmt_final_setup_EventFilter = $(bin)setup.make
cmt_dependencies_in_EventFilter = $(bin)dependencies.in
#cmt_final_setup_EventFilter = $(bin)EventFiltersetup.make
cmt_local_EventFilter_makefile = $(bin)EventFilter.make

endif

#cmt_final_setup = $(bin)setup.make
#cmt_final_setup = $(bin)EventFiltersetup.make

#EventFilter :: ;

dirs ::
	@if test ! -r requirements ; then echo "No requirements file" ; fi; \
	  if test ! -d $(bin) ; then $(mkdir) -p $(bin) ; fi

javadirs ::
	@if test ! -d $(javabin) ; then $(mkdir) -p $(javabin) ; fi

srcdirs ::
	@if test ! -d $(src) ; then $(mkdir) -p $(src) ; fi

help ::
	$(echo) 'EventFilter'

binobj = 
ifdef STRUCTURED_OUTPUT
binobj = EventFilter/
#EventFilter::
#	@if test ! -d $(bin)$(binobj) ; then $(mkdir) -p $(bin)$(binobj) ; fi
#	$(echo) "STRUCTURED_OUTPUT="$(bin)$(binobj)
endif

${CMTROOT}/src/Makefile.core : ;
ifdef use_requirements
$(use_requirements) : ;
endif

#-- end of make_header ------------------
#-- start of libary_header ---------------

EventFilterlibname   = $(bin)$(library_prefix)EventFilter$(library_suffix)
EventFilterlib       = $(EventFilterlibname).a
EventFilterstamp     = $(bin)EventFilter.stamp
EventFiltershstamp   = $(bin)EventFilter.shstamp

EventFilter :: dirs  EventFilterLIB
	$(echo) "EventFilter ok"

#-- end of libary_header ----------------

EventFilterLIB :: $(EventFilterlib) $(EventFiltershstamp)
	@/bin/echo "------> EventFilter : library ok"

$(EventFilterlib) :: $(bin)EventFilter.o $(bin)EventFilter_entries.o $(bin)EventFilter_load.o
	$(lib_echo) library
	$(lib_silent) cd $(bin); \
	  $(ar) $(EventFilterlib) $?
	$(lib_silent) $(ranlib) $(EventFilterlib)
	$(lib_silent) cat /dev/null >$(EventFilterstamp)

#------------------------------------------------------------------
#  Future improvement? to empty the object files after
#  storing in the library
#
##	  for f in $?; do \
##	    rm $${f}; touch $${f}; \
##	  done
#------------------------------------------------------------------

$(EventFilterlibname).$(shlibsuffix) :: $(EventFilterlib) $(EventFilterstamps)
	$(lib_silent) cd $(bin); QUIET=$(QUIET); $(make_shlib) "$(tags)" EventFilter $(EventFilter_shlibflags)

$(EventFiltershstamp) :: $(EventFilterlibname).$(shlibsuffix)
	@if test -f $(EventFilterlibname).$(shlibsuffix) ; then cat /dev/null >$(EventFiltershstamp) ; fi

EventFilterclean ::
	$(cleanup_echo) objects
	$(cleanup_silent) cd $(bin); /bin/rm -f $(bin)EventFilter.o $(bin)EventFilter_entries.o $(bin)EventFilter_load.o

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
EventFilterinstallname = $(library_prefix)EventFilter$(library_suffix).$(shlibsuffix)

EventFilter :: EventFilterinstall

install :: EventFilterinstall

EventFilterinstall :: $(install_dir)/$(EventFilterinstallname)
	@if test ! "${installarea}" = ""; then\
	  echo "installation done"; \
	fi

$(install_dir)/$(EventFilterinstallname) :: $(bin)$(EventFilterinstallname)
	@if test ! "${installarea}" = ""; then \
	  cd $(bin); \
	  if test ! "$(install_dir)" = ""; then \
	    if test ! -d "$(install_dir)"; then \
	      mkdir -p $(install_dir); \
	    fi ; \
	    if test -d "$(install_dir)"; then \
	      echo "Installing library $(EventFilterinstallname) into $(install_dir)"; \
	      if test -e $(install_dir)/$(EventFilterinstallname); then \
	        $(cmt_uninstall_area_command) $(install_dir)/$(EventFilterinstallname); \
	        $(cmt_uninstall_area_command) $(install_dir)/$(EventFilterinstallname).cmtref; \
	      fi; \
	      $(cmt_install_area_command) `pwd`/$(EventFilterinstallname) $(install_dir)/$(EventFilterinstallname); \
	      echo `pwd`/$(EventFilterinstallname) >$(install_dir)/$(EventFilterinstallname).cmtref; \
	    fi \
          else \
	    echo "Cannot install library $(EventFilterinstallname), no installation directory specified"; \
	  fi; \
	fi

EventFilterclean :: EventFilteruninstall

uninstall :: EventFilteruninstall

EventFilteruninstall ::
	@if test ! "${installarea}" = ""; then \
	  cd $(bin); \
	  if test ! "$(install_dir)" = ""; then \
	    if test -d "$(install_dir)"; then \
	      echo "Removing installed library $(EventFilterinstallname) from $(install_dir)"; \
	      $(cmt_uninstall_area_command) $(install_dir)/$(EventFilterinstallname); \
	      $(cmt_uninstall_area_command) $(install_dir)/$(EventFilterinstallname).cmtref; \
	    fi \
          else \
	    echo "Cannot uninstall library $(EventFilterinstallname), no installation directory specified"; \
	  fi; \
	fi




#-- start of cpp_library -----------------

ifneq (-MMD -MP -MF $*.d -MQ $@,)

ifneq ($(MAKECMDGOALS),EventFilterclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)EventFilter.d

$(bin)$(binobj)EventFilter.d :

$(bin)$(binobj)EventFilter.o : $(cmt_final_setup_EventFilter)

$(bin)$(binobj)EventFilter.o : $(src)EventFilter.cxx
	$(cpp_echo) $(src)EventFilter.cxx
	$(cpp_silent) $(cppcomp) -MMD -MP -MF $*.d -MQ $@ -o $@ $(use_pp_cppflags) $(EventFilter_pp_cppflags) $(lib_EventFilter_pp_cppflags) $(EventFilter_pp_cppflags) $(use_cppflags) $(EventFilter_cppflags) $(lib_EventFilter_cppflags) $(EventFilter_cppflags) $(EventFilter_cxx_cppflags)  $(src)EventFilter.cxx
endif
endif

else
$(bin)EventFilter_dependencies.make : $(EventFilter_cxx_dependencies)

$(bin)EventFilter_dependencies.make : $(src)EventFilter.cxx

$(bin)$(binobj)EventFilter.o : $(EventFilter_cxx_dependencies)
	$(cpp_echo) $(src)EventFilter.cxx
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(EventFilter_pp_cppflags) $(lib_EventFilter_pp_cppflags) $(EventFilter_pp_cppflags) $(use_cppflags) $(EventFilter_cppflags) $(lib_EventFilter_cppflags) $(EventFilter_cppflags) $(EventFilter_cxx_cppflags)  $(src)EventFilter.cxx

endif

#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq (-MMD -MP -MF $*.d -MQ $@,)

ifneq ($(MAKECMDGOALS),EventFilterclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)EventFilter_entries.d

$(bin)$(binobj)EventFilter_entries.d :

$(bin)$(binobj)EventFilter_entries.o : $(cmt_final_setup_EventFilter)

$(bin)$(binobj)EventFilter_entries.o : $(src)components/EventFilter_entries.cxx
	$(cpp_echo) $(src)components/EventFilter_entries.cxx
	$(cpp_silent) $(cppcomp) -MMD -MP -MF $*.d -MQ $@ -o $@ $(use_pp_cppflags) $(EventFilter_pp_cppflags) $(lib_EventFilter_pp_cppflags) $(EventFilter_entries_pp_cppflags) $(use_cppflags) $(EventFilter_cppflags) $(lib_EventFilter_cppflags) $(EventFilter_entries_cppflags) $(EventFilter_entries_cxx_cppflags) -I../src/components $(src)components/EventFilter_entries.cxx
endif
endif

else
$(bin)EventFilter_dependencies.make : $(EventFilter_entries_cxx_dependencies)

$(bin)EventFilter_dependencies.make : $(src)components/EventFilter_entries.cxx

$(bin)$(binobj)EventFilter_entries.o : $(EventFilter_entries_cxx_dependencies)
	$(cpp_echo) $(src)components/EventFilter_entries.cxx
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(EventFilter_pp_cppflags) $(lib_EventFilter_pp_cppflags) $(EventFilter_entries_pp_cppflags) $(use_cppflags) $(EventFilter_cppflags) $(lib_EventFilter_cppflags) $(EventFilter_entries_cppflags) $(EventFilter_entries_cxx_cppflags) -I../src/components $(src)components/EventFilter_entries.cxx

endif

#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq (-MMD -MP -MF $*.d -MQ $@,)

ifneq ($(MAKECMDGOALS),EventFilterclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)EventFilter_load.d

$(bin)$(binobj)EventFilter_load.d :

$(bin)$(binobj)EventFilter_load.o : $(cmt_final_setup_EventFilter)

$(bin)$(binobj)EventFilter_load.o : $(src)components/EventFilter_load.cxx
	$(cpp_echo) $(src)components/EventFilter_load.cxx
	$(cpp_silent) $(cppcomp) -MMD -MP -MF $*.d -MQ $@ -o $@ $(use_pp_cppflags) $(EventFilter_pp_cppflags) $(lib_EventFilter_pp_cppflags) $(EventFilter_load_pp_cppflags) $(use_cppflags) $(EventFilter_cppflags) $(lib_EventFilter_cppflags) $(EventFilter_load_cppflags) $(EventFilter_load_cxx_cppflags) -I../src/components $(src)components/EventFilter_load.cxx
endif
endif

else
$(bin)EventFilter_dependencies.make : $(EventFilter_load_cxx_dependencies)

$(bin)EventFilter_dependencies.make : $(src)components/EventFilter_load.cxx

$(bin)$(binobj)EventFilter_load.o : $(EventFilter_load_cxx_dependencies)
	$(cpp_echo) $(src)components/EventFilter_load.cxx
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(EventFilter_pp_cppflags) $(lib_EventFilter_pp_cppflags) $(EventFilter_load_pp_cppflags) $(use_cppflags) $(EventFilter_cppflags) $(lib_EventFilter_cppflags) $(EventFilter_load_cppflags) $(EventFilter_load_cxx_cppflags) -I../src/components $(src)components/EventFilter_load.cxx

endif

#-- end of cpp_library ------------------
#-- start of cleanup_header --------------

clean :: EventFilterclean ;
#	@cd .

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(EventFilter.make) $@: No rule for such target" >&2
else
.DEFAULT::
	$(error PEDANTIC: $@: No rule for such target)
endif

EventFilterclean ::
#-- end of cleanup_header ---------------
#-- start of cleanup_library -------------
	$(cleanup_echo) library EventFilter
	-$(cleanup_silent) cd $(bin); /bin/rm -f $(library_prefix)EventFilter$(library_suffix).a $(library_prefix)EventFilter$(library_suffix).s? EventFilter.stamp EventFilter.shstamp
#-- end of cleanup_library ---------------
