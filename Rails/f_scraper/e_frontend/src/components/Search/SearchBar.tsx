import { useState } from "react";

interface SearchBarProps {
  onSearch: (query: string) => void;
}

export default function SearchBar({ onSearch }: SearchBarProps) {
  const [query, setQuery] = useState("");

  const handleSearch = (e: React.ChangeEvent<HTMLInputElement>) => {
    const value = e.target.value;
    setQuery(value);
    onSearch(value); // Send query to parent component
  };

  return (
    <div className="mb-3">
      <input
        type="text"
        className="form-control"
        placeholder="Search products..."
        value={query}
        onChange={handleSearch}
      />
    </div>
  );
}
