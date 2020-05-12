#-- start of make_header -----------------

#====================================
#  Document HltResult_python
#
#   Generated Tue May 12 17:44:48 2020  by liuyan
#
#====================================

include ${CMTROOT}/src/Makefile.core

ifdef tag
CMTEXTRATAGS = $(tag)
else
tag       = $(CMTCONFIG)
endif

cmt_HltResult_python_has_no_target_tag = 1

#--------------------------------------------------------

ifdef cmt_HltResult_python_has_target_tag

tags      = $(tag),$(CMTEXTRATAGS),target_HltResult_python

HltResult_tag = $(tag)

#cmt_local_tagfile_HltResult_python = $(HltResult_tag)_HltResult_python.make
cmt_local_tagfile_HltResult_python = $(bin)$(HltResult_tag)_HltResult_python.make

else

tags      = $(tag),$(CMTEXTRATAGS)

HltResult_tag = $(tag)

#cmt_local_tagfile_HltResult_python = $(HltResult_tag).make
cmt_local_tagfile_HltResult_python = $(bin)$(HltResult_tag).make

endif

include $(cmt_local_tagfile_HltResult_python)
#-include $(cmt_local_tagfile_HltResult_python)

ifdef cmt_HltResult_python_has_target_tag

cmt_final_setup_HltResult_python = $(bin)setup_HltResult_python.make
cmt_dependencies_in_HltResult_python = $(bin)dependencies_HltResult_python.in
#cmt_final_setup_HltResult_python = $(bin)HltResult_HltResult_pythonsetup.make
cmt_local_HltResult_python_makefile = $(bin)HltResult_python.make

else

cmt_final_setup_HltResult_python = $(bin)setup.make
cmt_dependencies_in_HltResult_python = $(bin)dependencies.in
#cmt_final_setup_HltResult_python = $(bin)HltResultsetup.make
cmt_local_HltResult_python_makefile = $(bin)HltResult_python.make

endif

#cmt_final_setup = $(bin)setup.make
#cmt_final_setup = $(bin)HltResultsetup.make

#HltResult_python :: ;

dirs ::
	@if test ! -r requirements ; then echo "No requirements file" ; fi; \
	  if test ! -d $(bin) ; then $(mkdir) -p $(bin) ; fi

javadirs ::
	@if test ! -d $(javabin) ; then $(mkdir) -p $(javabin) ; fi

srcdirs ::
	@if test ! -d $(src) ; then $(mkdir) -p $(src) ; fi

help ::
	$(echo) 'HltResult_python'

binobj = 
ifdef STRUCTURED_OUTPUT
binobj = HltResult_python/
#HltResult_python::
#	@if test ! -d $(bin)$(binobj) ; then $(mkdir) -p $(bin)$(binobj) ; fi
#	$(echo) "STRUCTURED_OUTPUT="$(bin)$(binobj)
endif

${CMTROOT}/src/Makefile.core : ;
ifdef use_requirements
$(use_requirements) : ;
endif

#-- end of make_header ------------------
#-- start of install_python_header ------


installarea = ${CMTINSTALLAREA}
install_python_dir = $(installarea)

ifneq ($(strip "$(source)"),"")
src = ../$(source)
dest = $(install_python_dir)/python
else
src = ../python
dest = $(install_python_dir)
endif

ifneq ($(strip "$(offset)"),"")
dest = $(install_python_dir)/python
endif

HltResult_python :: HltResult_pythoninstall

install :: HltResult_pythoninstall

HltResult_pythoninstall :: $(install_python_dir)
	@if [ ! "$(installarea)" = "" ] ; then\
	  echo "installation done"; \
	fi

$(install_python_dir) ::
	@if [ "$(installarea)" = "" ] ; then \
	  echo "Cannot install header files, no installation source specified"; \
	else \
	  if [ -d $(src) ] ; then \
	    echo "Installing files from $(src) to $(dest)" ; \
	    if [ "$(offset)" = "" ] ; then \
	      $(install_command) --exclude="*.py?" $(src) $(dest) ; \
	    else \
	      $(install_command) --exclude="*.py?" $(src) $(dest) --destname $(offset); \
	    fi ; \
	  else \
	    echo "no source  $(src)"; \
	  fi; \
	fi

HltResult_pythonclean :: HltResult_pythonuninstall

uninstall :: HltResult_pythonuninstall

HltResult_pythonuninstall ::
	@if test "$(installarea)" = ""; then \
	  echo "Cannot uninstall header files, no installation source specified"; \
	else \
	  echo "Uninstalling files from $(dest)"; \
	  $(uninstall_command) "$(dest)" ; \
	fi


#-- end of install_python_header ------
#-- start of cleanup_header --------------

clean :: HltResult_pythonclean ;
#	@cd .

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(HltResult_python.make) $@: No rule for such target" >&2
else
.DEFAULT::
	$(error PEDANTIC: $@: No rule for such target)
endif

HltResult_pythonclean ::
#-- end of cleanup_header ---------------
