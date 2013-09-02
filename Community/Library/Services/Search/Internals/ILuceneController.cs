#region Copyright
// 
// DotNetNuke� - http://www.dotnetnuke.com
// Copyright (c) 2002-2013
// by DotNetNuke Corporation
// 
// Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated 
// documentation files (the "Software"), to deal in the Software without restriction, including without limitation 
// the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and 
// to permit persons to whom the Software is furnished to do so, subject to the following conditions:
// 
// The above copyright notice and this permission notice shall be included in all copies or substantial portions 
// of the Software.
// 
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED 
// TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL 
// THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF 
// CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER 
// DEALINGS IN THE SOFTWARE.
#endregion
#region Usings

using System;
using System.Collections.Generic;

using Lucene.Net.Documents;
using Lucene.Net.Search;

#endregion

namespace DotNetNuke.Services.Search.Internals
{
    internal interface ILuceneController
    {
        /// <summary>
        /// Execute Search
        /// </summary>
        /// <param name="luceneQuery">Search Parameters</param>
        /// <paramref name="totalHits">Total Hits found in Lucene</paramref>
        /// <returns>List of matching Documents</returns>
        IEnumerable<LuceneResult> Search(LuceneQuery luceneQuery, out int totalHits, SecurityCheckerDelegate securityChecker = null);

        /// <summary>
        /// Adds Lucene Document in Lucene Index
        /// </summary>
        void Add(Document doc);

        /// <summary>
        /// Delete a Search Document from the Search Index
        /// </summary>
        void Delete(Query query);

        /// <summary>
        /// Commits the added search documents into the search database
        /// </summary>
        void Commit();

        /// <summary>
        /// Optimize the search index files by compacting and removing previously deleted search documents.
        /// </summary>
        /// <remarks>
        /// This is a costly operation which consumes substantial CPU and I/O resources, therefore use it
        /// judiciously. If your site has a a single server that performs both indexing and searching, then 
        /// you should consider running the optimize operation after hours or over the weekend so that it
        /// does not interfere with ongoing search activities.
        /// <para>This means you should expect the size of your index to roughly triple (temporarily)
        /// during optimization. Once optimization completes, and once you call commit(), disk usage
        /// will fall back to a lower level than the starting size.</para>
        /// </remarks>
        /// <param name="doWait">Whether to run optimization on background thread or wait for optimization to finish.</param>
        /// <returns>True is optimization was scheduled to run in the background or ran to completion in foreground, false otherwise (due to
        /// that there were no deletions or the writer was not created yet).</returns>
        bool OptimizeSearchIndex(bool doWait);

        /// <summary>
        /// Returns number of total documents in the search index (including deleted ones).
        /// </summary>
        /// <returns>Number of total documents in the search index (including Deletions).</returns>
        int MaxDocsCount();

        /// <summary>
        /// Returns number of total searchable documents in the search index.
        /// </summary>
        /// <returns>Number of total searchable documents in the search index.</returns>
        int SearchbleDocsCount();

        /// <summary>
        /// Returns if the current search index has deletions
        /// </summary>
        /// <returns>Whther the search index has deletions or not</returns>
        bool HasDeletions();

        /// <summary>
        /// Returns current search indexs general information
        /// </summary>
        /// <returns><see cref="SearchStatistics"/> object or null if the information can not be retrieved.</returns>
        SearchStatistics GetSearchStatistics();
    }
}