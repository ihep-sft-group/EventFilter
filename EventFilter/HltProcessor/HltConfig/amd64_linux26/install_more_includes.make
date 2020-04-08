#-- start of make_header -----------------

#====================================
#  Document install_more_includes
#
#   Generated Tue Apr  7 10:24:23 2020  by liuyan
#
#====================================

include ${CMTROOT}/src/Makefile.core

ifdef tag
CMTEXTRATAGS = $(tag)
else
tag       = $(CMTCONFIG)
endif

cmt_install_more_includes_has_no_target_tag = 1

#--------------------------------------------------------

ifdef cmt_install_more_includes_has_target_tag

tags      = $(tag),$(CMTEXTRATAGS),target_install_more_includes

HltConfig_tag = $(tag)

#cmt_local_tagfile_install_more_includes = $(HltConfig_tag)_install_more_includes.make
cmt_local_tagfile_install_more_includes = $(bin)$(HltConfig_tag)_install_more_includes.make

else

tags      = $(tag),$(CMTEXTRATAGS)

HltConfig_tag = $(tag)

#cmt_local_tagfile_install_more_includes = $(HltConfig_tag).make
cmt_local_tagfile_install_more_includes = $(bin)$(HltConfig_tag).make

endif

include $(cmt_local_tagfile_install_more_includes)
#-include $(cmt_local_tagfile_install_more_includes)

ifdef cmt_install_more_includes_has_target_tag

cmt_final_setup_install_more_includes = $(bin)setup_install_more_includes.make
cmt_dependencies_in_install_more_includes = $(bin)dependencies_install_more_includes.in
#cmt_final_setup_install_more_includes = $(bin)HltConfig_install_more_includessetup.make
cmt_local_install_more_includes_makefile = $(bin)install_more_includes.make

else

cmt_final_setup_install_more_includes = $(bin)setup.make
cmt_dependencies_in_install_more_includes = $(bin)dependencies.in
#cmt_final_setup_install_more_includes = $(bin)HltConfigsetup.make
cmt_local_install_more_includes_makefile = $(bin)install_more_includes.make

endif

#cmt_final_setup = $(bin)setup.make
#cmt_final_setup = $(bin)HltConfigsetup.make

#install_more_includes :: ;

dirs ::
	@if test ! -r requirements ; then echo "No requirements file" ; fi; \
	  if test ! -d $(bin) ; then $(mkdir) -p $(bin) ; fi

javadirs ::
	@if test ! -d $(javabin) ; then $(mkdir) -p $(javabin) ; fi

srcdirs ::
	@if test ! -d $(src) ; then $(mkdir) -p $(src) ; fi

help ::
	$(echo) 'install_more_includes'

binobj = 
ifdef STRUCTURED_OUTPUT
binobj = install_more_includes/
#install_more_includes::
#	@if test ! -d $(bin)$(binobj) ; then $(mkdir) -p $(bin)$(binobj) ; fi
#	$(echo) "STRUCTURED_OUTPUT="$(bin)$(binobj)
endif

${CMTROOT}/src/Makefile.core : ;
ifdef use_requirements
$(use_requirements) : ;
endif

#-- end of make_header ------------------
#-- start of install_more_includes_header ------

#
#  We want to install all header files that follow the standard convention
#
#    ../<more>
#
#  This document generator needs no parameterization, since it simply expects
#  the standard convention.
#

installarea = ${CMTINSTALLAREA}
install_include_dir = $(installarea)/include

install_more_includes :: install_more_includesinstall

install :: install_more_includesinstall

install_more_includesinstall :: $(install_include_dir)
	@if test ! "$(installarea)" = ""; then\
	  echo "installation done"; \
	fi

$(install_include_dir) ::
	@if test "$(installarea)" = ""; then \
	  echo "Cannot install header files, no installation directory specified"; \
	else \
	  if test ! "" = "";then \
	    if test -d ../; then \
	       echo "Installing files from offset ../ to $(install_include_dir)"; \
	       if test ! -d $(install_include_dir) ; then mkdir -p $(install_include_dir); fi; \
	       if test ! -d $(install_include_dir)/; then mkdir -p $(install_include_dir)/; fi;\
	       $(install_command) ../ $(install_include_dir);\
	    else \
	       echo "no offset   include directory"; \
	    fi; \
	  fi; \
	  if test ! "HltConfig" = ""; then \
	    if test -d ../HltConfig; then \
	      echo "Installing files from more ../HltConfig to $(install_include_dir)"; \
	      if test ! -d $(install_include_dir) ; then mkdir -p $(install_include_dir); fi; \
	      if test ! -d $(install_include_dir)/HltConfig; then mkdir -p $(install_include_dir)/HltConfig; fi;\
	        $(install_command) ../HltConfig $(install_include_dir);\
	    else \
	      echo "No more HltConfig include directory"; \
	    fi; \
          fi; \
	fi

install_more_includesclean :: install_more_includesuninstall

uninstall :: install_more_includesuninstall

install_more_includesuninstall ::
	@if test "$(installarea)" = ""; then \
	  echo "Cannot uninstall header files, no installation directory specified"; \
	else \
	  echo "Uninstalling files from $(install_include_dir)/HltConfig"; \
	  $(uninstall_command) "$(install_include_dir)/HltConfig/*" ; \
	  if test -f $(install_include_dir)/HltConfig.cmtref ; then \
	    echo "Removing $(install_include_dir)/HltConfig.cmtref"; \
	    eval rm -f $(install_include_dir)/HltConfig.cmtref ; \
	  fi; \
	fi


#-- end of install_more_includes_header ------
#-- start of cleanup_header --------------

clean :: install_more_includesclean ;
#	@cd .

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(install_more_includes.make) $@: No rule for such target" >&2
else
.DEFAULT::
	$(error PEDANTIC: $@: No rule for such target)
endif

install_more_includesclean ::
#-- end of cleanup_header ---------------
