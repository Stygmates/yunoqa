
package="yunoqa"
version="0.1"

variables=(LUA_VERSION 5.3)

# FIXME: .in for PREFIX substitutions.
targets=(yunoqa.moon)
type[yunoqa.moon]=script
filename[yunoqa.moon]=yunoqa

for i in yunoqa/*.moon; do
	targets+=($i)
	type[$i]=script
	install[$i]='$(SHAREDIR)/lua/$(LUA_VERSION)/yunoqa'
done

dist=(
	# Build system.
	project.zsh Makefile
	# yunoqa
	yunoqa.moon yunoqa/*.moon
	# Other WIP scripts.
	check-recipes.moon
)

