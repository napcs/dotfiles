const fs = require('fs');
const path = require('path');

// Path to the dir holding your md and mdx files
const args = process.argv.slice(2);  // Slice off the first two arguments (node and script path)

if (args.length === 0) {
  console.error("Error: You must provide the path to the markdown directory.");
  console.error("Usage: node tag_audit.js <path-to-markdown-directory>");
  process.exit(1);
}

const markdownDirectory = args[0];

// Recursive function to collect markdown files. Start with empty file list..
function getMarkdownFiles(dir, fileList = []) {
  const files = fs.readdirSync(dir);

  files.forEach(file => {
    const filePath = path.join(dir, file);
    const stat = fs.statSync(filePath);

    if (stat.isDirectory()) {
      getMarkdownFiles(filePath, fileList);
    } else if (file.endsWith('.md') || file.endsWith('.mdx')) {
      fileList.push(filePath);
    }
  });

  return fileList;
}

// this should use a yaml library but I don't want dependencies, so regex it is.
function extractTags(content) {
  const frontMatterRegex = /^---\n([\s\S]*?)\n---/;  // Match everything between '---'
  const match = content.match(frontMatterRegex);

  if (match) {
    const yamlContent = match[1];  // The part of the file that is front matter
    const lines = yamlContent.split('\n');
    let tags = [];
    let inTags = false;

    lines.forEach(line => {
      const trimmedLine = line.trim();

      // Detect 'tags:' and start reading tags
      if (trimmedLine.startsWith('tags:')) {
        inTags = true;  // We are now in the tags block
      } else if (inTags) {
        if (trimmedLine.startsWith('-')) {
          tags.push(trimmedLine.replace('-', '').trim());  // Collect the tag
        } else if (trimmedLine === '' || !trimmedLine.startsWith('-')) {
          inTags = false;  // End of tags section
        }
      }
    });

    return tags;
  }

  // Return an empty array if no tags are found
  return [];
}

// Get all the tags
function scanMarkdownFiles(directory) {
  const tagMap = new Map();  // Map to store tags and where they were found

  const markdownFiles = getMarkdownFiles(directory);  // Get all markdown files

  markdownFiles.forEach((filePath) => {
    const content = fs.readFileSync(filePath, 'utf-8');
    const tags = extractTags(content);  // Extract tags from the front matter

    tags.forEach(tag => {
      if (tagMap.has(tag)) {
        tagMap.get(tag).count++;
        tagMap.get(tag).files.push(filePath);
      } else {
        tagMap.set(tag, { count: 1, files: [filePath] });
      }
    });
  });

  return tagMap;
}

// Display results
//
// Show all tags
// then show the tags that only have one page
// then show the # of tags.
function generateReport(tagMap) {
  tagMap.forEach((value, tag) => {
    console.log(`[${tag}] [${value.count} uses]`);
    value.files.forEach(file => {
      console.log(`- ${file}`);
    });
  });

  // Separate report for tags with only one entry
  console.log("\nTags used in only one file:");
  tagMap.forEach((value, tag) => {
    if (value.count === 1) {
      console.log(`[${tag}] [${value.count} use]`);
      value.files.forEach(file => {
      console.log(`- ${file}`);
      });
    }
  });

  console.log(`Total number of unique tags: ${tagMap.size}\n`);  // Emit the total number of unique tags
}


const tagMap = scanMarkdownFiles(markdownDirectory);  // Scan for tags
generateReport(tagMap);  // Generate the report
