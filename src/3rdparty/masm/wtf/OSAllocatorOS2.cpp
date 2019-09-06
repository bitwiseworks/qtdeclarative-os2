/*
 * Copyright (C) 2010 Apple Inc. All rights reserved.
 * Copyright (C) 2018 bww bitwise works GmbH. OS/2 parts.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 * 1. Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 * 2. Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 *
 * THIS SOFTWARE IS PROVIDED BY APPLE INC. AND ITS CONTRIBUTORS ``AS IS''
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
 * THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
 * PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL APPLE INC. OR ITS CONTRIBUTORS
 * BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
 * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
 * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
 * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
 * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF
 * THE POSSIBILITY OF SUCH DAMAGE.
 */

#include "config.h"
#include "OSAllocator.h"
#include "PageBlock.h"

#if OS(OS2)

#define INCL_BASE
#include <os2.h>

#include <wtf/Assertions.h>

namespace WTF {

static inline ULONG protection(bool writable, bool executable)
{
    return PAG_READ | (executable ? PAG_EXECUTE : 0) | (writable ? PAG_WRITE : 0);
}

void* OSAllocator::reserveUncommitted(size_t bytes, Usage, bool writable, bool executable)
{
    void* result = nullptr;
    ULONG flags = protection(writable, executable);
    if (DosAllocMem(&result, bytes, flags | OBJ_ANY))
        if (DosAllocMem(&result, bytes, flags))
            CRASH();
    return result;
}

void* OSAllocator::reserveAndCommit(size_t bytes, Usage, bool writable, bool executable,
                                    bool includesGuardPages)
{
    void* result = nullptr;
    ULONG flags = protection(writable, executable);
    if (DosAllocMem(&result, bytes, flags | PAG_COMMIT | OBJ_ANY))
        if (DosAllocMem(&result, bytes, flags | PAG_COMMIT))
            CRASH();
    if (includesGuardPages) {
        size_t guardSize = pageSize();
        if (DosSetMem(result, guardSize, flags | PAG_GUARD) ||
            DosSetMem(static_cast<char*>(result) + bytes - guardSize, guardSize, flags | PAG_GUARD))
            CRASH();
    }
    return result;
}

void OSAllocator::commit(void* address, size_t bytes, bool writable, bool executable)
{
    if (DosSetMem(address, bytes, protection(writable, executable) | PAG_COMMIT))
        CRASH();
}

void OSAllocator::decommit(void* address, size_t bytes)
{
    if (DosSetMem(address, bytes, PAG_DECOMMIT))
        CRASH();
}

void OSAllocator::releaseDecommitted(void* address, size_t bytes)
{
    (void) bytes; // suppress unused formal parameter warning
    if (DosFreeMem(address))
        CRASH();
}

bool OSAllocator::canAllocateExecutableMemory()
{
    return true;
}

} // namespace WTF

#endif // OS(OS2)
