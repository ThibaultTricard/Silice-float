.DEFAULT: unitTest.ice
ifdef tool
		silice-make.py -s unit_test.ice -b $@ -p basic -o BUILD_$(subst :,_,$@) -t $(tool)
else
		silice-make.py -s unit_test.ice -b $@ -p basic -o BUILD_$(subst :,_,$@)
endif

clean:
	rm -rf BUILD_*