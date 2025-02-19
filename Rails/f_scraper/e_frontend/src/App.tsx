import { useState, useEffect } from "react";
import axios from "axios";
import { Product } from "./types";  // Import Product interface
import SearchBar from "./components/Search/SearchBar";
import ScrapeForm from "./components/Scrape/ScrapeForm";
import ProductList from "./components/Product/ProductList";

export default function App() {
  const [products, setProducts] = useState<Product[]>([]);
  const [filteredProducts, setFilteredProducts] = useState<Product[]>([]);

  useEffect(() => {
    axios
      .get<Product[]>("http://localhost:3000/products")
      .then((res) => {
        setProducts(res.data);
        setFilteredProducts(res.data);
      })
      .catch((err) => console.error("Error fetching products:", err));
  }, []);

  const handleNewProduct = (product: Product) => {
    const updatedProducts = [...products, product];
    setProducts(updatedProducts);
    setFilteredProducts(updatedProducts);
  };

  const handleSearch = (query: string) => {
    if (!query) {
      setFilteredProducts(products);
    } else {
      const filtered = products.filter((p) =>
        p.title.toLowerCase().includes(query.toLowerCase())
      );
      setFilteredProducts(filtered);
    }
  };

  return (
    <div className="container mt-4">
      <h1 className="mb-4 text-center">Product Scraper</h1>
      <SearchBar onSearch={handleSearch} />
      <ScrapeForm onNewProduct={handleNewProduct} />
      <ProductList products={filteredProducts} />
    </div>
  );
}
