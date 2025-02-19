import { useState, useEffect } from "react";
import { Product } from "../../types";
import axios from "axios";

interface ProductListProps {
  products: Product[];
}

export default function ProductList({ products }: ProductListProps) {
  const [loading, setLoading] = useState<{ [key: number]: boolean }>({});

  useEffect(() => {
    products.forEach((product) => {
      if (product.outdated) {
        setLoading((prev) => ({ ...prev, [product.id]: true }));

        axios.post(`http://localhost:3000/products/${product.id}/refresh`).then(() => {
          setLoading((prev) => ({ ...prev, [product.id]: false }));
        });
      }
    });
  }, [products]);

  return (
    <div className="card">
      <div className="card-header bg-primary text-white">
        <h2 className="h5 m-0">Scraped Products</h2>
      </div>
      <ul className="list-group list-group-flush">
        {products.map((product) => (
          <li key={product.id} className="list-group-item">
            <h3 className="h6">{product.title}</h3>
            <p className="text-muted">{product.description}</p>
            <p className="fw-bold text-success">₹{product.price}</p>
            {loading[product.id] && <span className="spinner-border spinner-border-sm"></span>}
          </li>
        ))}
      </ul>
    </div>
  );
}
