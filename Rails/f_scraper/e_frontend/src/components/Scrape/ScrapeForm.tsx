import { useState } from "react";
import axios from "axios";

interface ScrapeFormProps {
  onNewProduct: (product: any) => void;
}

export default function ScrapeForm({ onNewProduct }: ScrapeFormProps) {
  const [url, setUrl] = useState("");

  const handleSubmit = async () => {
    if (!url) return;
    try {
      const response = await axios.post("http://localhost:3000/products", { url });
      onNewProduct(response.data); // Send new product to parent
      setUrl(""); // Clear input
    } catch (error) {
      console.error("Error scraping product:", error);
    }
  };

  return (
    <div className="mb-3">
      <div className="input-group">
        <input
          type="text"
          className="form-control"
          placeholder="Enter product URL"
          value={url}
          onChange={(e) => setUrl(e.target.value)}
        />
        <button className="btn btn-primary" onClick={handleSubmit}>
          Scrape
        </button>
      </div>
    </div>
  );
}
