#!/bin/bash

echo "Checando suporte a conjuntos de instruções..."

# Checa SSE
if lscpu | grep -q 'sse'; then
    echo "SSE suportado"
else
    echo "SSE não suportado"
fi

# Checa SSE2
if lscpu | grep -q 'sse2'; then
    echo "SSE2 suportado"
else
    echo "SSE2 não suportado"
fi

# Checa AVX
if lscpu | grep -q 'avx '; then
    echo "AVX suportado"
else
    echo "AVX não suportado"
fi

# Checa AVX2
if lscpu | grep -q 'avx2'; then
    echo "AVX2 suportado"
else
    echo "AVX2 não suportado"
fi

# Checa AVX-512
if lscpu | grep -q 'avx512'; then
    echo "AVX-512 suportado"
else
    echo "AVX-512 não suportado"
fi

# Checa FMA
if lscpu | grep -q 'fma'; then
    echo "FMA suportado"
else
    echo "FMA não suportado"
fi


#CPU flag detection
echo "****Getting CPU flag capabilities and number of cores"
cat /proc/cpuinfo  | egrep "(flags|model name|vendor)" | sort | uniq -c
#Compiler capabilities. -march=native is required!
echo "****Getting GCC capabilities"
gcc -march=native -dM -E - < /dev/null | egrep "SSE|AVX" | sort
#OS kernel version
echo "****Getting OS Kernel Version"
uname -a
