with open('pubspec.yaml', 'r') as f:
    content = f.read()

content = content.replace("dependency_overrides:\n  test_api: 0.7.9\n  matcher: 0.12.18", "dependency_overrides:\n  analyzer: '>=7.0.0 <9.0.0'")
with open('pubspec.yaml', 'w') as f:
    f.write(content)
